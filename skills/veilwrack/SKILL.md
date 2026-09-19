---
name: veilwrack
description: The Veilwrack campaign for mythras-gm — an original sky-realm setting where winged Alar live on the bone-spires of dead sky-leviathans and the wind is dying. Use when the user wants to play, start or continue The Veilwrack, or asks about the Stilling, the Alar, Lanternfall, the Hushed, or windworking.
---

# The Veilwrack: The Stilling

A campaign package for the **mythras-gm** engine. This is not a second GM manual
— the engine owns how to run a table (`TABLE.md`). This owns the things the
engine structurally cannot know.

## 1. Where this campaign's files are

A plugin cannot resolve a sibling plugin's root, so the engine cannot tell you
where this campaign lives. Here it is:

```bash
VW="${CLAUDE_PLUGIN_ROOT}"
. "${VW}/scripts/engine.sh"    # sets GM_ROOT, GM_SKILL, GM_CLI and a gm() function
```

| what | where |
|---|---|
| player-facing setting guide | `${VW}/setting/veilwrack.md` |
| **the world's physics** | `${VW}/setting/natural-philosophy.md` |
| geography, bands, travel | `${VW}/setting/geography.md` |
| the four catechisms | `${VW}/setting/upbringings.md` |
| chargen, careers, windworking | `${VW}/setting/character-creation.md`, `${VW}/setting/alar-options.md` |
| daily life, law, money, names | `${VW}/setting/life-aloft.md` |
| history | `${VW}/setting/history.md` |
| **GM only** | `${VW}/setting/gm-secrets.md`, `antagonists.md`, `organizations.md`, `bestiary.md` |

## 2. The campaign id

```
myth-campaign-ac1041cfb4fb
```

Fixed, shipped in `campaign.yaml`, identical on every install. Set
`MYTH_CAMPAIGN` to it and stop passing `--campaign`. A first run needs
`/veilwrack:start`, which imports it. If `get-campaign` on that id fails the
campaign is not imported yet — say so rather than improvising, and **never GM
from the files in this package**: they are a source export, not the save, and
edits to them never reach the game.

## 3. Read the physics before you narrate

This is the one rule that makes this setting work and it is the easiest to skip.

There is **no ground**. The world is floating bone-spires — the skeletons of dead
sky-leviathans — and beneath a certain altitude band there is no lift and no
return. The Alar are winged; flight is not a luxury, it is the road, the economy
and the law. **The wind is what holds all of it up.**

So: lift, altitude band and air state are *always* part of a scene, the way
ground and light are in other games. A character does not simply "go" somewhere
— they go up, and being out of breath in thin air is a fact about the world, not
flavour. `setting/natural-philosophy.md` is short and it is load-bearing.

**The Stilling is the premise.** Lanternfall's windlane began going still this
season. A still zone is not a calm place; it is a place with nothing holding you
up. Play it as the environment turning off, not as weather.

## 4. Never read these during play

| do not read | what is in it |
|---|---|
| `setting/gm-secrets.md` | what the Stilling actually is |
| `setting/antagonists.md` | the five-tier opposition structure |
| `setting/organizations.md` | the eight organizations' *real* aims, as against their stated ones |
| lore marked `visibility: "gm"` | assorted reveals |

These are yours to use. What is in them lands **in play** and never in narration
before then.

The record of the first run — its full journal, its encounters, and the
novelisation *The Kestrel of Lanternfall* — is on the **`playthroughs` branch**
and is not part of a release. If you find `novels/` in your working copy you are
on a contributor's checkout: it is somebody else's game and reading it will make
you tell this one wrong.

## 5. This campaign's own conventions

- **`brief --id <location>` before you describe anywhere.** Spires are not
  interchangeable and the staging notes carry the air.
- **Organizations have stated aims and real ones.** When an NPC speaks for one,
  know which you are playing.
- **The Hushed are not monsters to be solved.** The lampwright that followed the
  evacuees out of Lanternfall remembers its mother and she is in the crowd. Play
  that, not a stat block.
