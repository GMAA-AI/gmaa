---
name: gmaa-place
description: After adopt-yes, create ~/Code/<project> and copy the sealed engine zip from Downloads. Does not unpack.
argument-hint: "<project-slug>"
---

Require an explicit operator yes to adopt, and a lowercase project slug with no spaces. Run this plugin's `scripts/gmaa-place-engine.sh <project>`. That mkdir -p `$HOME/Code/<project>` and copies `gmaa-engine-grok_*.zip` from `$HOME/Downloads` into it. Do not unzip. Do not mkdir `foundation/` or lane folders. Do not `git init`. Instantiation remains a later vanilla `grok` session in that parent folder.
