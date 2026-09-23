# WuBuGames — Testing (Sep 23 2026, v1)

## Purpose
How we know anything works. Exact steps, pass/fail criteria.

## The Protocol
```bash
export PATH="$HOME/.wubugames-tools/bin:$PATH"

# 1. Pipeline canary — MUST be green before any commit
cd /home/wubu/WuBuGames/tools/smoke
rm -f smoke.rbxl
rojo build -o smoke.rbxl && selene src && stylua --check src && echo ALL-GREEN
# PASS = "ALL-GREEN" printed, smoke.rbxl exists
# FAIL = any non-zero exit or rojo error

# 2. Per-game gate (same three checks, run in the game dir)
cd /home/wubu/WuBuGames/games/<name>
rojo build -o ../build/<name>.rbxl && selene src && stylua --check src && echo GAME-GREEN
```

## Future (when Studio installed)
- Playtest = run in Studio, watch Output window for the smoke greet prints from server + client scripts.
- `rojo serve` sync check: connect Studio plugin, edit a file, see it land.

## Pass/Fail Criteria
| Check | Pass | Fail |
|-------|------|------|
| rojo build | .rbxl file produced, no errors | any rojo ERROR line |
| selene | "0 errors" | any error count > 0 |
| stylua --check | exit 0, no diff | any listed file |
| smoke.rbxl | exists, >500 bytes | missing or 0 bytes |

## Anti-Phantom-PASS Rules
- "It compiles" ≠ "it works". A green build only proves syntax + tree mapping. Runtime behavior needs a Studio playtest.
- Never claim a game "runs" without either a Studio playtest log or a Lune unit test executing the module logic.
- Unit-testable logic goes in `src/shared/` modules with pure functions so Lune can run them headless.
