#!/usr/bin/env bash
#
# Veilwrack preflight. Reports the state of the save; never changes it.
#
# Deliberately does NOT import the campaign. Importing writes a few hundred rows
# and is a real act with a real cost, so it belongs to a command the user ran
# (/veilwrack:start), not to a hook that fires every time they open a terminal.
# All this does is find out where things stand and say so, because on
# SessionStart hook stdout reaches the model.
#
# Like the engine's preflight, it never exits non-zero: having this plugin
# enabled must not block a session in an unrelated directory.

set -uo pipefail
unset VIRTUAL_ENV

SEED_ID="myth-campaign-ac1041cfb4fb"

# `set -u` is on, so a bare ${CLAUDE_PLUGIN_ROOT} does not degrade to empty --
# it aborts this script with "unbound variable" and exit 1, which is precisely
# the one thing the header above promises never happens. The variable is set
# when Claude Code runs the hook, and unset whenever anyone runs this file by
# hand to see what it says. Fall back to the directory this script lives in.
VW="${CLAUDE_PLUGIN_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"

# shellcheck source=/dev/null
. "${VW}/scripts/engine.sh"

if [ -z "${GM_ROOT}" ]; then
  cat <<MSG
veilwrack: the mythras-gm engine is not installed, so this campaign cannot run.

  /plugin install mythras-gm@fourth-wall-gaming

Veilwrack declares that dependency, so it should have arrived automatically --
if it did not, install it by hand, or set MYTHRAS_GM_ROOT to a checkout. Until
then: do not GM this campaign off the files in this package. They are a source
export, not a save file, and nothing you change in them reaches the game.
MSG
  exit 0
fi

if ! command -v uv >/dev/null 2>&1; then
  echo "veilwrack: uv is not installed, so the engine CLI cannot run. Install it (https://docs.astral.sh/uv/) and start a new session."
  exit 0
fi

# The engine's own hook normally has the database up already. Calling init-db
# here too is cheap, idempotent, and removes any dependence on hook ordering.
if ! INIT=$(gm init-db 2>&1); then
  REMEDY=$(printf '%s' "$INIT" | python3 -c 'import json,sys; d=json.load(sys.stdin); print(d.get("remedy") or d.get("error") or "")' 2>/dev/null || true)
  [ -z "$REMEDY" ] && REMEDY="$INIT"
  cat <<MSG
veilwrack: PREFLIGHT FAILED -- the game database is not usable, so there is no
save file and no dice tower.

  ${REMEDY}

Do not narrate, do not roll, and do not tell the user anything was saved. Offer
to run /mythras-gm:setup.
MSG
  exit 0
fi

if gm get-campaign --campaign "$SEED_ID" >/dev/null 2>&1; then
  STATE=$(gm get-campaign --campaign "$SEED_ID" 2>/dev/null | python3 -c '
import json,sys
try:
    c = json.load(sys.stdin).get("campaign") or {}
except Exception:
    print("?|?"); raise SystemExit
print(f"{c.get(\"myth-game-date\") or \"?\"}|{c.get(\"myth-session-number\")}")
' 2>/dev/null || echo "?|?")
  CLOCK="${STATE%%|*}"; SESSION="${STATE##*|}"
  if [ "${SESSION:-0}" = "0" ]; then
    echo "veilwrack: the campaign is imported and has not been started (clock ${CLOCK}). Run /veilwrack:start to choose a character and open the scenario. MYTH_CAMPAIGN=${SEED_ID}"
  else
    echo "veilwrack: a game is in progress -- ${SEED_ID}, clock ${CLOCK}, session ${SESSION}. Resume it with /mythras-gm:play. Do NOT run /veilwrack:start; it is for a campaign that has not begun."
  fi
  exit 0
fi

echo "veilwrack: the campaign is installed but has not been imported into the database yet. Run /veilwrack:start -- it will import ${SEED_ID} from ${VW} and walk the player through choosing a character. Do not GM from the files in this package; they are a source export, not the save."
exit 0
