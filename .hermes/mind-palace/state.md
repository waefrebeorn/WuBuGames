# WuBuGames — State (Sep 23 2026, v1)

## Purpose
Live status dashboard. What's verified vs claimed vs broken.

## Toolchain Truth Table
| Component | Claim | Status | Evidence |
|-----------|-------|--------|----------|
| rojo build | src → .rbxl | ✅ PASS | Built `tools/smoke/smoke.rbxl` (1260 bytes, valid binary), Sep 23 07:08 |
| selene lint | 0 errors | ✅ PASS | `selene src` → 0/0/0 on smoke canary, with generated roblox.yml std |
| stylua | clean | ✅ PASS | `stylua --check src` → exit 0 |
| lune | installed | ✅ PASS | `lune --version` → 0.10.5 (not yet used on a real script) |
| rojo serve | live sync | ⛔ UNTESTED | Needs Studio running (not installed) |
| rojo upload | headless publish | ⛔ UNTESTED | Needs Open Cloud API key |
| Roblox Studio | — | ❌ NOT INSTALLED | No dirs under /mnt/c/Users/eman5/AppData/Local/Roblox, no registry key |

## Environment Facts
- WSL2, x86_64. No unzip, no sudo. Python zipfile fallback works.
- rokit 1.2.0 installed but headless-hostile (trust prompt requires TTY, hangs with piped stdin AND inside `script -qec`). Direct GitHub release binaries are the workaround. Do not retry rokit installs without a TTY strategy.
- Tool binaries at `~/.wubugames-tools/bin`, PATH persisted in `~/.bashrc`.

## Pipeline Verification Loop (run after ANY toolchain change)
```bash
export PATH="$HOME/.wubugames-tools/bin:$PATH"
cd /home/wubu/WuBuGames/tools/smoke
rm -f smoke.rbxl
rojo build -o smoke.rbxl && selene src && stylua --check src && echo ALL-GREEN
```
Last run: ALL-GREEN (Sep 23 2026, 07:08 EDT).

## What's NOT Verified
- No game exists yet. Zero Luau beyond the smoke canary.
- No publish path. No Studio. No playtest.
