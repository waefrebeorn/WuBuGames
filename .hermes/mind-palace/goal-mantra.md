── WuBuGames — GOAL MANTRA ──
Path: /home/wubu/WuBuGames | Tools: ~/.wubugames-tools/bin (rojo 7.7.0, lune 0.10.5, stylua 2.5.2, selene 0.31.0)

=== STATE ===
✅ Toolchain verified: rojo build → .rbxl, selene 0 err, stylua clean
✅ Smoke canary green: tools/smoke (ALL-GREEN 2026-09-23)
⛔ No Roblox Studio on Windows (user must install)
⛔ No publish path (Studio or Open Cloud API key)

=== STREAMS ===
S1 [P0] Studio install / Open Cloud key → first upload
S2 [P1] Scaffold first game in games/ (Storage Wars: WuBu Storage)
S3 [P1] gates.sh: one-command lint+format+build for all games
S4 [P2] Lune unit tests for shared/ logic

=== THE LOOP ===
pick highest undone → code → selene+stylua+rojo build → ALL-GREEN? → commit
"It compiles" ≠ "it works" — runtime claims need Studio playtest or Lune test.
Blocked on S1? Build S2/S3 anyway — pipeline needs no Studio.

=== FULL CONTEXT ===
Read .hermes/mind-palace/prestige_prompt.md
