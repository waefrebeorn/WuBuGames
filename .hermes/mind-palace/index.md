# WuBuGames — Index (Sep 23 2026, v1)

## Purpose
Navigation hub. Where everything lives.

## Walkway (read order)
| # | File | What's in it |
|---|------|--------------|
| 1 | `prestige_prompt.md` | Full resume: mission, stack, priorities, blockers |
| 2 | `entry.md` | Commands, environment facts, how to run |
| 3 | `state.md` | Live truth table: verified vs broken |
| 4 | `plan.md` | Phase roadmap + first-game candidates |
| 5 | `testing.md` | The gate protocol, pass/fail criteria |
| 6 | `project.md` | Mission, constraints, done/pending |
| 7 | `index.md` | This file |

## Repo Map
```
/home/wubu/WuBuGames/
├── games/                        # each game = self-contained rojo project
├── build/                        # .rbxl artifacts (gitignored)
├── tools/smoke/                  # pipeline canary — KEEP GREEN
│   ├── default.project.json
│   ├── src/{shared,server,client}/
│   ├── selene.toml + roblox.yml  # roblox.yml = generated selene std (755KB)
│   └── smoke.rbxl                # build output (gitignored)
└── .hermes/
    ├── mind-palace/              # walkway (this dir)
    │   ├── plans/
    │   ├── references/
    │   └── presentation/
    ├── research/                 # roblox platform research notes
    └── vault/                    # durable findings
```

## Toolchain
| Binary | Version | Location |
|--------|---------|----------|
| rojo | 7.7.0 | ~/.wubugames-tools/bin |
| lune | 0.10.5 | ~/.wubugames-tools/bin |
| stylua | 2.5.2 | ~/.wubugames-tools/bin |
| selene | 0.31.0 | ~/.wubugames-tools/bin |
| rokit | 1.2.0 | ~/.rokit/bin (unusable headless) |

## Key Decisions
1. Direct GitHub binaries over rokit — rokit's trust prompt needs a TTY, hangs headless.
2. Server-authoritative architecture for all games.
3. Smoke canary in tools/ as permanent pipeline tripwire.
4. First game concept: Storage Wars: WuBu Storage (see plan.md).
