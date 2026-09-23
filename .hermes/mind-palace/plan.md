# WuBuGames — Plan (Sep 23 2026, v1)

## Purpose
Roadmap from "toolchain green" to "published game with players".

## Phase Roadmap
| Phase | Goal | Exit Criteria | Status |
|-------|------|---------------|--------|
| 0 | Toolchain + studio setup | rojo/selene/stylua/lune verified, smoke canary green | ✅ DONE 2026-09-23 |
| 1 | Studio + publish path | Studio installed on Windows, OR Open Cloud key; one upload succeeds | ⛔ blocked on user |
| 2 | First playable prototype | One game in `games/`: lobby spawn + one core loop mechanic + win/lose | pending |
| 3 | Polish + juice | Sounds, UI, effects, datastores (session stats) | pending |
| 4 | Publish + iterate | Public place, first external player, analytics read | pending |
| 5 | Second game / series | Reuse pipeline; WuBu IP crossover game | pending |

## Dependency Graph
```
Phase 0 ──> Phase 1 ──> Phase 2 ──> Phase 3 ──> Phase 4 ──> Phase 5
              (user: Studio            (design first
               or API key)              game concept)
```

## First Game Candidates (decide at Phase 2 kickoff)
1. **Storage Wars: WuBu Storage** — Old UNC's storage-unit auction game. Bid on units, dig through junk, find the MEGA artifact. Comedy = random junk items with flavor text. Fits IP naturally.
2. **Wishing Well Simulator** — the well "only appears when nobody's recording it": social deduction-ish mechanic where cameras off = well visible.
3. **Obby with a twist** — fastest to market, but slop-adjacent. Only as pipeline warm-up.

## Gates (build discipline)
- Every game must pass: `selene src` 0 errors, `stylua --check` clean, `rojo build` success — before any commit.
- Server-authoritative: all game state mutations happen server-side.
- `--!strict` types on all new modules.
