# Setting Sources

The original worldbook source documents for **The Veilwrack: The Stilling**.
The `lore/` directory at the repo root contains these same texts sliced into
database-ready lore entries; the files here are the canonical, full-prose
versions (section intros and connective text included).

| File | Contents | Audience |
|---|---|---|
| `veilwrack.md` | Player-facing setting guide | player |
| `geography.md` | Altitude bands, polities, places, power, travel | player |
| `history.md` | Eras from the Elder Sky to the Stilling Age | player |
| `upbringings.md` | Four player catechisms ("What my Mother/Father/Priest/Chief told me") | player |
| `life-aloft.md` | Calendar, names, law, money, spire life, etiquette, rumors | player (rumors: GM) |
| `natural-philosophy.md` | Plausible physics of the sky world | player + GM appendix |
| `character-creation.md` | Chargen procedure, passions, roleplay guide | player |
| `alar-options.md` | Careers, Windworking, racial abilities, aerial movement, gear | player |
| `bestiary.md` | Stat blocks | GM |
| `organizations.md` | 8 organizations: nature, real vs stated aims, ranks, hooks | GM |
| `antagonists.md` | Five-tier opposition structure | GM |
| `gm-secrets.md` | The truth, the campaign arc, the NPCs | **GM only** |

## Seed scripts

`seed_veilwrack.sh` (entities) and `seed_lore.py` (lore) rebuild the campaign
from scratch via the [mythras-gm](https://github.com/fourth-wall-gaming/mythras-gm)
engine CLI; point them at it with `MYTHRAS_GM_CLI`. For most purposes prefer
the lossless route instead:

```bash
python mythras_gm.py import-campaign --path /path/to/veilwrack-campaign --new-ids
```
