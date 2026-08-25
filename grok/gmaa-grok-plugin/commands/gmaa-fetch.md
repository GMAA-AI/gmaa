---
name: gmaa-fetch
description: Download the sealed Grok engine zip into ~/Downloads and verify sha256. Does not unzip or instantiate.
---

Run this plugin's `scripts/gmaa-fetch-engine.sh`. It writes `gmaa-engine-grok_*.zip` into `$HOME/Downloads` and checks sha256 against `https://raw.githubusercontent.com/gmaa-ai/gmaa/main/grok/SHA256SUMS`. HALT on mismatch. Do not unzip. Do not mkdir `foundation/`. Do not `git init`. On adopt, `/gmaa-place <project>` copies that zip into `~/Code/<project>/`.
