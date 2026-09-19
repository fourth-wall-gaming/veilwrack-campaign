---
description: Begin The Veilwrack from the beginning — introduce Mythras, import the campaign, choose or roll an Alar, and open the first scene.
---

# Start The Veilwrack

The zero-state path. Use this when the campaign has never been played on this
machine. **If a game is already in progress, stop and use `/mythras-gm:play`
instead** — step 2 checks, and it matters, because a start command that resets
somebody's campaign is worse than no start command at all.

Resolve the engine first; everything below needs it:

```bash
. "${CLAUDE_PLUGIN_ROOT}/scripts/engine.sh"   # sets GM_ROOT, GM_SKILL, GM_CLI, gm()
[ -z "$GM_ROOT" ] && echo "mythras-gm is not installed: /plugin install mythras-gm@fourth-wall-gaming"
```

## 1. Is the player new to Mythras? Brief them first

Ask — do not assume. If they have played it, say so in a line and move on.

If they have not, read `${GM_SKILL}/NEW-TO-MYTHRAS.md` and give them the
one-minute version **in your own words**: skills are percentages you roll under,
combat picks hit locations and lets the winner choose a Special Effect, and
Passions are the good bit. Offer the links, and **inwils' YouTube channel** if
they would rather be shown than read.

Do this **before** character creation. Knowing that Passions matter changes what
a player writes down.

## 2. Check the state of the save

```bash
gm init-db                                        # idempotent; stop and report if it fails
gm get-campaign --campaign myth-campaign-ac1041cfb4fb
```

- **Not found** → carry on to step 3.
- **Found with `myth-session-number` of 0** → already imported, never started.
  Skip step 3.
- **Found with a session number above 0** → a game is in progress. **Stop.**
  Hand them `/mythras-gm:play`. Do not import and do not re-seed.

## 3. Import the campaign

```bash
gm import-campaign --path "${CLAUDE_PLUGIN_ROOT}"
```

46 lore entries, 4 spires, 7 factions, 13 characters, 5 creature templates. The
id is fixed on purpose: importing the same package twice fails loudly rather
than quietly forking the save.

## 4. Read the table rules and the world

Not optional, and not summarised here:

- `${GM_SKILL}/TABLE.md` — how to run the table
- `${GM_SKILL}/styles/gamesmaster.md` — the voice
- `${CLAUDE_PLUGIN_ROOT}/setting/veilwrack.md` — the player-facing setting guide
- `${CLAUDE_PLUGIN_ROOT}/setting/natural-philosophy.md` — **read this one before
  you describe anything moving.** This world has physical laws and they are the
  whole texture: what lift is, what the bands are, what happens in still air.

`setting/gm-secrets.md`, `setting/antagonists.md` and `setting/organizations.md`
are GM-side. Use them; do not narrate out of them.

## 5. Describe the setting

Read `${CLAUDE_PLUGIN_ROOT}/setting/veilwrack.md` and give it to them properly —
about five minutes, in your own words, and **stop as soon as they start asking
questions**, because their questions are better than your briefing.

The four things they must walk away with: there is no ground — the world is
floating bone-spires, the skeletons of dead sky-leviathans, and everything below
a certain band is death; the Alar are winged and flight is not a luxury but the
entire economy; the wind is what holds all of it up; and **the wind is dying.**
Lanternfall's windlane began Stilling this season and the Wardens have not said
the word aloud yet.

Then offer `setting/upbringings.md` — the four catechisms, *what my Mother /
Father / Priest / Chief told me*. They are the fastest way into this world's head
and they are written to be read aloud.

## 6. Offer the three, in full

Give them **a real paragraph each**, all three before you ask, because nobody can
choose from a list they have not heard:

- **Kithrel of the Moult** — Vael courier turned Gale Warden, the fastest
  survey-flier in the company. For a player who wants to move, see things first,
  and get somewhere before anyone else can.
- **Sefa Rocksquill** — a Vael lance of the Lanternfall Warden draft, hugely
  built for kestrel-kin, wingspear and target. For a player who wants to stand
  in front of the thing and hold.
- **Vorrh** — Ossuin death-diver, cast out of the Deepway. An outcast who
  watches, asks unwelcome questions, and does not let go of an answer. For a
  player who wants the world to be wrong and to be the one who proves it.

Do not rank them. Do not have a favourite out loud. The other two stay in the
world as GM-run companions they will meet — say so; it makes the choice feel
less like a door closing, and it is true.

**Or they roll their own.** `${CLAUDE_PLUGIN_ROOT}/setting/character-creation.md`
is the procedure and `${CLAUDE_PLUGIN_ROOT}/setting/alar-options.md` has the
careers, Windworking, the racial abilities and aerial movement. Work through it
*with* them, and follow `TABLE.md §0b` — roll first and decide who they are
second, ask what they are doing on this spire this season and who would notice if
they stopped, and build the Passions with a collision in them on purpose.

Do not write a backstory for them. Ask, and write down what they say, then save
it with `update-character --actor-notes`.

## 7. Set it up

For a pregen:

```bash
gm update-campaign --campaign myth-campaign-ac1041cfb4fb --played <chosen-pc-id>
```

For a rolled character: `create-character --type pc`, then **`move-character` to
a real spire** — without that they are nowhere.

Then, either way:

```bash
gm set-scene --campaign myth-campaign-ac1041cfb4fb --scene "<their opening>"
gm update-campaign --campaign myth-campaign-ac1041cfb4fb --session-number 1
gm log-event --campaign myth-campaign-ac1041cfb4fb --type session-start --summary "..."
```

## 8. Open the scene

Lanternfall Spire is the starting site and it is written for this: an evacuation
under pressure, a lane-shrine beacon-horn that still works, a Stillwight hunting
the dead stretch of lane, and a Hushed child following the evacuees out — it
remembers its mother, and she is among them.

`brief --id <location>` before you describe anywhere. Then narrate the opening —
two to four sentences, sound and air before sight, because in this world the
first thing anyone notices is what the wind is doing — and **stop**, and hand the
floor over. Do not play the first scene for them.

From here on it is `/mythras-gm:play`.
