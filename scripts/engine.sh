#!/usr/bin/env bash
#
# Find the mythras-gm engine. Sourced by this plugin's hook and cited by its
# commands; sets GM_ROOT, GM_SKILL and GM_CLI, or returns 1.
#
# This exists because of a hard limit in the plugin system: ${CLAUDE_PLUGIN_ROOT}
# resolves to THIS plugin's directory and there is no variable for a sibling's.
# A campaign plugin therefore cannot name the engine it depends on, even though
# the dependency guarantees it is installed. So we look, in order of how much we
# trust the answer.

_engine_find() {
  # 1. Told explicitly. The documented escape hatch, and what CI uses.
  if [ -n "${MYTHRAS_GM_ROOT:-}" ] && [ -f "${MYTHRAS_GM_ROOT}/skills/mythras-gm/mythras_gm.py" ]; then
    printf '%s' "${MYTHRAS_GM_ROOT}"; return 0
  fi

  # 2. The breadcrumb the engine's own init-db drops. Deterministic and
  #    version-agnostic -- but a plugin upgrade can leave it stale, so check.
  local pointer="${HOME}/.claude/mythras-gm/engine-root"
  if [ -f "$pointer" ]; then
    local p; p=$(head -1 "$pointer" 2>/dev/null)
    if [ -n "$p" ] && [ -f "${p}/skills/mythras-gm/mythras_gm.py" ]; then
      printf '%s' "$p"; return 0
    fi
  fi

  # 3. Search the plugin cache. Written against the real layout -- note the
  #    two-segment skills/mythras-gm/ -- and taking the HIGHEST version, because
  #    several can be installed at once and the newest is the one to use.
  local hit
  hit=$(find "${HOME}/.claude/plugins/cache" -maxdepth 6 \
          -path '*/mythras-gm/*/skills/mythras-gm/mythras_gm.py' 2>/dev/null \
        | sort -V | tail -1)
  if [ -n "$hit" ]; then
    printf '%s' "${hit%/skills/mythras-gm/mythras_gm.py}"; return 0
  fi

  # 4. Local development: --plugin-dir siblings, or a checkout next door.
  local cand
  for cand in "${CLAUDE_PLUGIN_ROOT}/../mythras-gm" \
              "${CLAUDE_PROJECT_DIR:-.}/../mythras-gm" \
              "${HOME}/mythras-gm"; do
    if [ -f "${cand}/skills/mythras-gm/mythras_gm.py" ]; then
      ( cd "$cand" && pwd ); return 0
    fi
  done

  return 1
}

if GM_ROOT=$(_engine_find); then
  GM_SKILL="${GM_ROOT}/skills/mythras-gm"
  GM_CLI="${GM_SKILL}/mythras_gm.py"
  export GM_ROOT GM_SKILL GM_CLI
  gm() { uv run -q --project "$GM_SKILL" python "$GM_CLI" "$@"; }
else
  GM_ROOT=""; export GM_ROOT
fi
