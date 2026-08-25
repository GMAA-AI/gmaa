---
name: restart
description: >
  B6 restart pickup. Use when the user runs /restart, says restart, or
  I need to restart. Write lane-local pointers, then orc-restart --force.
when-to-use: /restart, restart, I need to restart
user-invocable: true
argument-hint: "[optional operator note]"
---

# Restart (B6 pickup)

Recognize spoken **restart** / **I need to restart** and **/restart**. Write now.
Do not /compact. Do not bare `grok`. Law: past ~50% context at a WP/wave
boundary, restart; never open a new WP above ~70% (OPERATOR-GUIDE).

Repo root: `git rev-parse --show-toplevel`. Missing `_boot/BOOTSTRAP.md` → HALT.
`eval "$(scripts/resolve-lane.sh)"`. Carry Settled law from existing
`dispatch/LATEST.md`.

Write (three jobs):
1. `dispatch/LATEST.md` — next-action pointer + CHECKPOINT ready for restart.
   Open items also in issues_register / WP as stage B6 says.
2. `.grok/session_state.json` — lane-local resume. Create `.grok/` if needed.
   If missing, genesis `{"in_flight_iter": null}` then UPDATE. Do not wipe keys.
3. `.grok/agent-memory/orc/MEMORY.md` — short index to LATEST.

Re-read. Confirm ready for restart. Operator relaunch is
`scripts/orc-restart.sh <lane> --force` (then launch-orc / orc-up). Never a
bare grok CLI.
