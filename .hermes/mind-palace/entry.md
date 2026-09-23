# WuBuGames — Entry (Sep 23 2026, v1)

## Purpose
How to run everything. HW/OS facts, commands, paths.

## Environment
- WSL2 (Windows 11), x86_64. Windows user: `eman5` (`/mnt/c/Users/eman5`).
- Linux tools in `~/.wubugames-tools/bin` (on PATH via ~/.bashrc). rokit exists at `~/.rokit/bin` but is UNUSABLE headless (trust prompt needs TTY).
- No `unzip` binary, no sudo. Use `python3 -c "import zipfile; ..."` to extract zips.
- Network: OK (github reachable).

## Commands
```bash
export PATH="$HOME/.wubugames-tools/bin:$PATH"   # if fresh shell without .bashrc

# Build a game to .rbxl
cd /home/wubu/WuBuGames/tools/smoke && rojo build -o smoke.rbxl

# Live-sync a game into open Roblox Studio (Studio must be running w/ Rojo plugin)
rojo serve default.project.json

# Lint (must run from dir containing roblox.yml OR use tools/smoke copy)
cd <game> && selene src

# Format
stylua src            # write
stylua --check src    # CI gate

# Regenerate selene Roblox std
selene generate-roblox-std   # writes roblox.yml in cwd

# Publish headless (needs Open Cloud API key)
rojo upload --place_id <ID> --api_key <KEY> default.project.json
```

## Launch Studio from WSL (once installed)
```bash
exe="$(ls -d /mnt/c/Users/eman5/AppData/Local/Roblox/versions/*/ | tail -1)RobloxStudioBeta.exe"
"$exe" &
```

## Kill/Clean
- No daemons. `rojo serve` is the only long-running process; Ctrl-C to stop.
- Build artifacts (`*.rbxl`, `*.rbxl.lock`) are gitignored.

## Architecture Diagram
```
~/WuBuGames/
├── games/           # each game = self-contained rojo project
├── build/           # output artifacts
├── tools/smoke/     # pipeline canary (keep green)
└── .hermes/         # mind palace (this)
```
