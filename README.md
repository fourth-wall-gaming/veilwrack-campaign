# The Veilwrack: The Stilling

An original sky-realm campaign. Winged Alar peoples on the floating bone-spires of dead sky-leviathans face the Stilling: the wind itself is dying.

A **Mythras Imperative** campaign in the
[mythras-gm](https://github.com/fourth-wall-gaming/mythras-gm) publishable
campaign format (v1.0).

| Contents | Count |
|---|---|
| Lore entries | 46 |
| Characters | 11 (PCs: Kithrel of the Moult, Vorrh) |
| Creature templates | 5 |
| Locations | 4 |
| Factions | 7 |
| Encounters | 1 |
| Journal events | 12 |

## Repository layout

| Directory | Contents |
|---|---|
| `lore/` | The worldbook, one markdown file per entry, grouped by category |
| `characters/` | PCs, NPCs, and creatures (full sheets + GM narratives, JSON) |
| `templates/` | Reusable creature/NPC stat blocks (JSON) |
| `locations/` | Places (markdown + frontmatter) |
| `factions/` | Factions and organizations (markdown + frontmatter) |
| `encounters/` | Combat encounter state (JSON) |
| `journal/` | The campaign event log (JSON) |
| `novels/` | Novelizations of actual play, one directory per protagonist/party |

The canonical full-prose worldbook sources live in [`setting/`](setting/) — see its README for the book list and audience guide. The `lore/` files below are the same material sliced into database-ready entries.

## The worldbook (lore index)

**bestiary**
- [Bestiary of the Veilwrack](lore/bestiary/bestiary-of-the-veilwrack.md) *(GM only)*

**careers**
- [Careers of the Veilwrack](lore/careers/careers-of-the-veilwrack.md)

**character-creation**
- [Character Creation and Roleplay Guide](lore/character-creation/character-creation-and-roleplay-guide.md)

**cosmology**
- [The World of the Veilwrack](lore/cosmology/the-world-of-the-veilwrack.md)

**culture**
- [The Three Kindreds](lore/culture/the-three-kindreds.md)

**daily-life**
- [The Calendar and the Festivals](lore/daily-life/the-calendar-and-the-festivals.md)
- [Alar Names](lore/daily-life/alar-names.md)
- [Law and Justice](lore/daily-life/law-and-justice.md)
- [Money and Daily Economy](lore/daily-life/money-and-daily-economy.md)
- [Living on a Spire](lore/daily-life/living-on-a-spire.md)
- [Etiquette Worth Knowing](lore/daily-life/etiquette-worth-knowing.md)

**economy**
- [Currency and Gear](lore/economy/currency-and-gear.md)

**factions**
- [Factions of the Veilwrack](lore/factions/factions-of-the-veilwrack.md)

**geography**
- [Key Locations](lore/geography/key-locations.md)
- [The Shape of the World: Altitude Bands](lore/geography/the-shape-of-the-world-altitude-bands.md)
- [Lesser Powers and Places](lore/geography/lesser-powers-and-places.md)
- [Distances and Travel](lore/geography/distances-and-travel.md)

**gm-guide**
- [Antagonists and Opposition Structure](lore/gm-guide/antagonists-and-opposition-structure.md) *(GM only)*
- [Rumors Current in 1001 A.S.](lore/gm-guide/rumors-current-in-1001-a-s.md) *(GM only)*

**gm-secret**
- [GM Secrets: The Truth, the Arc, the NPCs](lore/gm-secret/gm-secrets-the-truth-the-arc-the-npcs.md) *(GM only)*

**history**
- [A History of the Veilwrack](lore/history/a-history-of-the-veilwrack.md)

**house-rules**
- [Combat Styles and Traits](lore/house-rules/combat-styles-and-traits.md)
- [Aerial Movement Rules](lore/house-rules/aerial-movement-rules.md)

**magic-system**
- [Windworking](lore/magic-system/windworking.md)
- [Powers of the Touched](lore/magic-system/powers-of-the-touched.md) *(GM only)*

**natural-philosophy**
- [Natural Philosophy: The Quillate Consensus](lore/natural-philosophy/natural-philosophy-the-quillate-consensus.md)
- [Natural Philosophy: GM Appendix](lore/natural-philosophy/natural-philosophy-gm-appendix.md) *(GM only)*

**organization**
- [Organization: The Gale Wardens](lore/organization/organization-the-gale-wardens.md) *(GM only)*
- [Organization: The Spirarchy and Crown Agents](lore/organization/organization-the-spirarchy-and-crown-agents.md) *(GM only)*
- [Organization: The Quillate](lore/organization/organization-the-quillate.md) *(GM only)*
- [Organization: The Deepway](lore/organization/organization-the-deepway.md) *(GM only)*
- [Organization: The Lane-Shrine Cantorate](lore/organization/organization-the-lane-shrine-cantorate.md) *(GM only)*
- [Organization: The Marrower Combine](lore/organization/organization-the-marrower-combine.md) *(GM only)*
- [Organization: The Hushed Choir](lore/organization/organization-the-hushed-choir.md) *(GM only)*
- [Organization: The Featherwrights' Guild](lore/organization/organization-the-featherwrights-guild.md) *(GM only)*
- [Using Organizations in Play](lore/organization/using-organizations-in-play.md) *(GM only)*

**politics**
- [The Great Polities](lore/politics/the-great-polities.md)
- [How Power Works in the Veilwrack](lore/politics/how-power-works-in-the-veilwrack.md)

**rules-reference**
- [Mythras Magic and Powers Rules](lore/rules-reference/mythras-magic-and-powers-rules.md)

**species**
- [Alar Anatomy and Body Plan](lore/species/alar-anatomy-and-body-plan.md)
- [Alar Racial Abilities](lore/species/alar-racial-abilities.md)

**threat**
- [The Stilling](lore/threat/the-stilling.md)

**upbringing**
- [What My Mother Told Me (Vael)](lore/upbringing/what-my-mother-told-me-vael.md)
- [What My Father Told Me (Roak)](lore/upbringing/what-my-father-told-me-roak.md)
- [What My Priest Told Me (Ossuin)](lore/upbringing/what-my-priest-told-me-ossuin.md)
- [What My Chief Told Me (the Roostless)](lore/upbringing/what-my-chief-told-me-the-roostless.md)

## Dramatis personae

**Player characters**
- [Kithrel of the Moult](characters/pcs/kithrel-of-the-moult.json) — Vael courier turned Gale Warden; the fastest survey-flier in the company
- [Vorrh](characters/pcs/vorrh.json) — Ossuin death-diver, cast out of the Deepway; an outcast who watches, asks unwelcome questions, and dives where no one is permitted.

**NPCs**
- [The Hushed Lampwright](characters/npcs/the-hushed-lampwright.json) — Tilve Wickmend - Vael lamp-tender of Lanternfall's western face, nine years on the lamps; betrothed of Hollm, the Deepway diver lost below the skim. Went down past the root-line on a tether, came up silent, and has not spoken or written since. Still lights every lamp, on schedule.
- [Talon Serra Redjess](characters/npcs/talon-serra-redjess.json) — Lanhawk Talon-captain of the Redjess clutch; the campaign's recurring corsair.
- [Quiet Plume Avess](characters/npcs/quiet-plume-avess.json) — Senior Crown Agent; the courteous face of the archive suppression.
- [Recensor Velute](characters/npcs/recensor-velute.json) — The Spirarchy's keeper of the founding lie; author of the cruelest clean solution.
- [Archivist Orrocan](characters/npcs/archivist-orrocan.json) — High Quill of the deep stacks; terrified custodian of the self-filling shelves.
- [Sister Ulvane](characters/npcs/sister-ulvane.json) — Stairwarden of the Long Stair; the Synod's pragmatic edge.
- [Hssh](characters/npcs/hssh.json) — Sotto Voce of the Choir; the faction of the cult that wants to help.
- [Brell Coinfeather](characters/npcs/brell-coinfeather.json) — Roostless fixer and information broker; insurance is her religion.
- [Commander Esk Veil-Torn](characters/npcs/commander-esk-veil-torn.json) — Warden Company-Commander of the Lanternfall draft; the PCs' patron.

## Factions

- [The Gale Wardens](factions/the-gale-wardens.md) — Rangers, rescue-fliers, and Stilling-surveyors. The player characters' company.
- [The Spirarchy of Suruveil's Crown](factions/the-spirarchy-of-suruveil-s-crown.md) — Ruling council of the capital. Order, continuity, legitimacy.
- [The Quillate](factions/the-quillate.md) — The Roak archive-guild: the longest unbroken written record in the world.
- [The Hushed Choir](factions/the-hushed-choir.md) — A cult that worships the Stilling as the world's overdue sabbath. They walk into still zones singing.
- [The Marrowers](factions/the-marrowers.md) — Industrial guild tapping spire-marrow breath as lift-gas. Profitable. Catastrophic.
- [The Lanhawk Mews](factions/the-lanhawk-mews.md) — The loose council of windlane pirate clutches out of the Veyl Reefs.
- [The Deepway of Carrowspar](factions/the-deepway-of-carrowspar.md) — The Ossuin funerary order: keepers of the descent, the wax, and the Long Stair.

## Novels

Actual play at the table, retold as fiction — one play session per chapter, drafted from the campaign journal via the mythras-gm novelization workflow.

- [The Veilwrack: The Stilling](novels/vorrh/vorrh.pdf) — Vorrh's run, in the style of Moorcock

## Loading this campaign

```bash
python skills/mythras-gm/mythras_gm.py import-campaign --path <this-directory> --new-ids
```

Then resume play with `get-context --campaign <new-id>`.

> Lore files marked `visibility: "gm"` contain spoilers. Players: browse
> `lore/` but skip anything GM-marked, and stay out of `encounters/` and
> `journal/` if you want to avoid table history.

Based on Mythras Imperative, Written by Pete Nash and Lawrence Whitaker,
published by The Design Mechanism, Copyright 2023, used under the ORC License.
