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

# Do NOT call init-db here. It is not concurrency-safe -- run two together and
# whichever loses exits 1 with a TypeDB commit conflict -- and the engine's own
# SessionStart hook calls it at this exact moment. When both hooks called it one
# always lost, and the loser announced that the save file did not exist on a
# perfectly healthy install. Observed from both sides in real sessions.
#
# The engine owns bringing the database up. This hook only waits for it to become
# readable. init-db appears once, as a last resort, for the case where the
# engine's hook did not run at all -- by which point nothing is racing us.
DB_READY=""
for _ in 1 2 3 4 5 6; do
  if gm list-campaigns >/dev/null 2>&1; then DB_READY="yes"; break; fi
  sleep 2
done

if [ -z "${DB_READY}" ]; then
  gm init-db >/dev/null 2>&1 || true
  PROBE=$(gm list-campaigns 2>&1) && DB_READY="yes"
fi

if [ -z "${DB_READY}" ]; then
  REMEDY=$(printf '%s' "${PROBE:-}" | python3 -c '
import json,sys
try:
    d = json.load(sys.stdin)
except Exception:
    print(""); raise SystemExit
print(d.get("remedy") or d.get("error") or "")
' 2>/dev/null || true)
  [ -z "$REMEDY" ] && REMEDY="${PROBE:-the database did not become readable}"
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
  # NB: no backslashes and no single quotes inside this snippet. It is wrapped in
  # a single-quoted shell string, and the previous version used \" escapes inside
  # an f-string expression -- a SyntaxError, so python3 exited non-zero every
  # time, the fallback fired, SESSION became "?" rather than "0", and this hook
  # took the in-progress branch and told the player NOT to run the start command.
  # It left no trace because the snippet's stderr is discarded.
  STATE=$(gm get-campaign --campaign "$SEED_ID" 2>/dev/null | python3 -c '
import json,sys
try:
    c = json.load(sys.stdin).get("campaign") or {}
except Exception:
    print("?|?"); raise SystemExit
date = c.get("myth-game-date") or "?"
session = c.get("myth-session-number")
print("%s|%s" % (date, session))
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
