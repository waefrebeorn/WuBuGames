# WuBuGames — Prestige Prompt (Sep 23 2026, v1)

## Purpose
Full context resume for any session working on Roblox game development.

## Mission
Make Roblox games. Studio root = `/home/wubu/WuBuGames`. This is the new course (was: WuBuTV/WuBuMovie media empire). WuBu creative rules carry over: NON-SLOP, original world, funny + active + voiced.

## One-Liner
Roblox game studio in WSL: rojo-built Luau games, linted by selene, formatted by stylua, automated by lune, verified by real builds.

## Stack (VERIFIED 2026-09-23)
| Tool | Version | Path | Verified |
|------|---------|------|----------|
| rojo | 7.7.0 | ~/.wubugames-tools/bin | ✅ builds .rbxl from src |
| lune | 0.10.5 | ~/.wubugames-tools/bin | ✅ runs |
| stylua | 2.5.2 | ~/.wubugames-tools/bin | ✅ --check clean |
| selene | 0.31.0 | ~/.wubugames-tools/bin | ✅ 0 errors w/ roblox std |

- Tools NOT in rokit (rokit 1.2.0 trust prompt requires a TTY and hangs headless — direct binary download used instead).
- `roblox.yml` (selene Roblox std, 755KB) committed in `tools/smoke/` — regenerate with `selene generate-roblox-std`.
- Smoke canary: `tools/smoke/` — shared/server/client Luau + default.project.json → `rojo build` → smoke.rbxl. Re-run after any toolchain change.

## Architecture Convention (per game)
```
games/<name>/
├── default.project.json   # rojo DataModel map
├── selene.toml            # std = "roblox"
├── .stylua.toml           # indent 2, quotes double
└── src/
    ├── shared/            # ModuleScripts → ReplicatedStorage.Shared
    ├── server/            # .server.luau → ServerScriptService
    └── client/            # .client.luau → StarterPlayerScripts
```

## Key Rules (Roblox)
- Luau typed Lua: `--!strict` at top of every module. Type annotations required.
- `.server.luau` = Script, `.client.luau` = LocalScript, plain `.luau` = ModuleScript, `init.luau` makes folder a module.
- Rojo: `$className` + `$path` on the same node requires $path to be a Folder — don't set both for script dirs.
- Server-authoritative always. Client sends intent (RemoteEvent), server validates + applies.
- Never trust client input; rate-limit RemoteEvent handlers.
- ReplicatedStorage = shared code; ServerStorage = server-only; Workspace = 3D scene.

## Priority Queue
| P | Task | Status |
|---|------|--------|
| P0 | Roblox Studio install on Windows + account login (USER ACTION — GUI installer, needs login) | ⛔ blocked on user |
| P0-alt | Open Cloud API key → `rojo upload --place_id N --api_key` (headless publish, no Studio needed) | ⛔ needs user key |
| P1 | First real game scaffold in `games/` | pending |
| P1 | `gates.sh` — one-command lint+format+build check for all games | pending |
| P2 | Luau language server (lua-language-server) for editor integration | pending |
| P2 | First playable: lobby + core loop | pending |

## Known Blockers
- No Roblox Studio installed on Windows (checked: no Roblox dirs, no registry key). Studio is required for playtesting visuals, terrain, UI layout, and first-time publish. Install from https://create.roblox.com (Windows installer; launch from WSL via `/mnt/c/.../RobloxStudioBeta.exe`).
- Publishing needs either Studio (cookie auth) or an Open Cloud API key from create.roblox.com → Settings → Security.

## Design DNA (from WuBu mandate)
Games must be ACTIVE (real gameplay, not vibes), FUNNY (comedy baked into mechanics), and PERSONALITIED (Old UNC / storage units / teal orb / MEGA universe is the in-house IP well). Original world, crossover invasions, no slop.
