# GMAA v2.7.2 · permission hotfix HF1

**Applies to:** the GMAA engine v2.7.2, `gmaa-engine_v2.7.2.zip`, sha256 `be2e73c2cf5e854869f878eec2a7b403176929da9231a13610373931a3c24cb2`. This is not a new engine release: the engine stays v2.7.2, at canon pin v1.6.9. A project that applies this hotfix cites v2.7.2-hf1. If you run v2.7, take v2.7.2 first (its `CHANGELOG.md` entry says how), then this hotfix; it was tested on v2.7.2 only.

**What it is.** Two engine files. Each is copied byte for byte from the commit of the engine's upstream source where the upstream landed this fix, `376524a2da2ecc3bcb74ae3b72083e7047de1e19`, a descendant of v2.7.2's pin `c062d0f73d8370fd25e489f32aef158dadbe7c49`. No other file changes.

## What it fixes
- `scripts/greenlight-policy.sh`, the permission hook on every Bash call:
  - `curl`, `wget`, `nc`, `ssh` and `sudo` now stop auto-approval only as a whole word. Before, they also matched at the end of a longer word followed by a space, so a call containing `func x`, `async x` or `no-ssh x` fell through to a permission prompt. `ssh host`, `| nc h 1` and `/usr/bin/curl x` still fall through.
  - An `&` stops auto-approval unless it is part of `2>&1` standing as a word of its own, so an otherwise approved call that merges its error output into its output is no longer prompted. Every other `&` (background, `&&`, `&>`, `|&`) still falls through to the prompt.
- `.claude/settings.json`: one allow rule, `Bash(scripts/seat-exit.sh *)`. `scripts/seat-exit.sh` is a seat's last act at every restart and shutdown. When a seat's running copy of the permission hook differs from the spine's copy, as at a restart after the spine moved, the hook approves nothing, so the call prompted and the restart waited on that prompt. The settings now carry 49 allow, 1 ask and 10 deny rules.

v2.7.2's `CHANGELOG.md`, with its known residue, holds as written. Its two residue items on the permission hook (the git words it reads, and the abbreviated bypass flag) are not this fix's, and they stand.

## The files
| path | v2.7.2 sha256 (old) | this hotfix sha256 (new) |
|---|---|---|
| `.claude/settings.json` | `13db5769cc17cce05979b78380c690d5c6528cc52e2413de9820101b956937a5` | `a103582e78bf6febd1d49f53b2bba037f87eb65151e661a468914f792d4dac7b` |
| `scripts/greenlight-policy.sh` | `d47b67b03086a27e0724072fde186250737b99587fb486133fcc469584808d91` | `89b64241d190b8e6503adc3fdb8d6fd73a960b59d7ad9333a763fc26d9d0a205` |

Neither file carries an adopter-fill slot.

## Instructions for the adopter
Foundation runs these steps, the executor builds the change, and you, the apex ratifier, give the decision. They are `docs/ENGINE-UPDATE.md` (B0 to B6) and the executor's patch route in `FIRST-SET.md` ("The executor's builds"), with this hotfix's two files filled in. Stop at any step that does not print what it says, and take it to foundation. Run each command block below as one command, in one shell: its lines share variables. The permission hook gives no approval to a command of more than one line, or to a line holding `$(` or `&&`, by design, so a block may bring a permission prompt: approve it as you read it. No block runs `rm -rf`. The shipped settings deny it, so a seat is refused it and is never prompted. The throwaway folders the blocks make are left for you to remove from your own terminal (step 5 says how).

**To start, paste this into foundation's session** (put the folder you downloaded into, as an absolute path, in place of `<folder>`):
```
Apply the GMAA v2.7.2 permission hotfix HF1 from <folder>, by its HOTFIX.md "Instructions for the adopter", in order. Hand step 4 to the executor by a relay in its inbox. Halt and tell me at any mismatch. Bring me the set for my decision.
```

1. **Verify the download.** Put `gmaa-hotfix_v2.7.2-hf1.zip`, `HOTFIX.md` and `SHA256SUMS` in one folder outside your project, and in that folder run:
   ```
   shasum -a 256 -c SHA256SUMS
   unzip -q gmaa-hotfix_v2.7.2-hf1.zip -d hotfix-hf1
   (cd hotfix-hf1 && shasum -a 256 -c MANIFEST.sha256)
   ```
   The first prints 2 lines ending `OK`, the last prints 4. Anything else: stop.
2. **Check every lane's stamp (B0).** For each lane worktree, `scripts/resolve-project.sh <worktree>` and, from inside it, `scripts/resolve-lane.sh` both exit 0. A lane that fails gets nothing until its stamp is fixed.
3. **Classify the two files (B2).** In foundation's worktree:
   ```
   shasum -a 256 .claude/settings.json scripts/greenlight-policy.sh
   ```
   Each value equals the **old** sha256 in the table above: take the new file. A value that differs means your copy was changed: that file is a CONFLICT, and foundation rules on it before anything is applied. Neither file carries a slot, so B3 has nothing to stop on.
4. **Build the change (the executor).** Both files are spine paths, so the executor builds the change and delivers it as a patch, by `FIRST-SET.md`'s route. The build is made in a throwaway clone outside the program root, never in a seat's own worktree; the commit made there is the build's bytes, never a seat commit. From the executor's worktree:
   ```
   R=$(bash scripts/spine-ref.sh) && git fetch -q origin "${R#origin/}" && B=$(git rev-parse "$R") && d=$(mktemp -d "${TMPDIR:-/tmp}/gmaa-hf1.XXXXXX")
   git clone -q "$(git remote get-url origin)" "$d/b" && git -C "$d/b" checkout -q "$B"
   cp -p <folder>/hotfix-hf1/.claude/settings.json "$d/b/.claude/settings.json"
   cp -p <folder>/hotfix-hf1/scripts/greenlight-policy.sh "$d/b/scripts/greenlight-policy.sh"
   git -C "$d/b" add .claude/settings.json scripts/greenlight-policy.sh
   git -C "$d/b" -c user.name=executor -c user.email=executor@localhost -c commit.gpgsign=false commit -q -m 'v2.7.2 hotfix HF1'
   P=ledger/apply-receipts/builds/HF1/0001-hotfix-hf1.patch && mkdir -p "$(dirname "$P")"
   git -C "$d/b" format-patch -1 --stdout > "$P" && T=$(git -C "$d/b" rev-parse 'HEAD^{tree}')
   git add "$P" && git commit -q -m 'executor: build HF1 as a patch' && git push -q origin HEAD
   printf 'branch: %s\nbranch sha: %s\npatch: %s sha256 %s\nbase: %s\ntree on base: %s\n' "$(git branch --show-current)" "$(git rev-parse HEAD)" "$P" "$(shasum -a 256 "$P" | cut -d' ' -f1)" "$B" "$T"
   ```
   The block's `git push` meets the shipped settings' ask rule, so a seat asks for it even when the rest is approved. The executor's relay to foundation carries the five lines the last command prints. The clone stays in your temp folder, and step 5 says how to remove it. A re-run of the block makes a fresh one.
5. **Apply and prove it in a clean checkout (B4).** Foundation applies the patch in a throwaway clone of the stated base, outside the program root, never in its own worktree, and judges it there. A fresh clone is not an adopted worktree (it has no boot record and no lane stamp), so the boot check and the probes show red there before anything is applied. The judge is therefore the difference: the same checks run on the base and on the patched tree, and the two outputs must be identical. From foundation's worktree, with the relay's values in place of `<branch>`, `<base>` and `<patch>`:
   ```
   d=$(mktemp -d "${TMPDIR:-/tmp}/gmaa-hf1.XXXXXX") && git clone -q "$(git remote get-url origin)" "$d/a" && cd "$d/a" && git checkout -q <base>
   prove(){ { bash scripts/boot-check.sh; for p in $(sed -n 's/^ *path: //p' agents/standing-probes.yaml); do case "$p" in *.py) python3 "$p";; *) bash "$p";; esac; echo "PROBE $p rc=$?"; done; } 2>&1 | sed -E 's/[0-9a-f]{7,40}/<id>/g; s/[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9:]{8}Z/<t>/g; s/[0-9]+ commits scanned/<n> commits scanned/'; }
   prove > "$d/base.txt"
   git fetch -q origin <branch> && git show FETCH_HEAD:<patch> > "$d/hf1.patch"
   shasum -a 256 "$d/hf1.patch"
   git -c user.name=foundation -c user.email=foundation@localhost -c commit.gpgsign=false am -q "$d/hf1.patch"
   git rev-parse 'HEAD^{tree}'
   shasum -a 256 .claude/settings.json scripts/greenlight-policy.sh
   R=$(bash scripts/spine-ref.sh) && git update-ref "refs/remotes/$R" HEAD
   prove > "$d/tip.txt"
   diff "$d/base.txt" "$d/tip.txt" && echo "PROVE: the patched tree shows nothing the base does not"
   cd - >/dev/null
   ```
   The patch's sha256 equals the relay's, the tree id equals the relay's, the two files print the **new** sha256 values in the table above, and the last line is the `PROVE:` line. Any difference, or any line `diff` prints: stop. `prove` runs `bash scripts/boot-check.sh` and every probe in `agents/standing-probes.yaml`, with commit ids and times masked; `scripts/spine-ref.sh` prints your trunk as `origin/<trunk>` (the name you filled at genesis), and `update-ref` points that ref at the patched commit, as it would be after landing, so the checks read the patched tree as the spine. The checkout stays in your temp folder too: each throwaway folder from steps 4 and 5 is named `gmaa-hf1.` and six more characters, under `${TMPDIR:-/tmp}`. A seat is refused `rm -rf`, which the shipped settings deny, so remove them from your own terminal once the hotfix has landed (step 6): `rm -rf "${TMPDIR:-/tmp}"/gmaa-hf1.*`.
6. **Land it (B6).** Back in foundation's own worktree, B6 steps 1 to 8 as written, with one member: `--footprint-lanes` names every lane (step 7 reaches each), `--intent 'v2.7.2 hotfix HF1: the permission hook and its settings'` and `--surfaces '.claude/settings.json scripts/greenlight-policy.sh'`. No member is committed before your decision. You give the decision. Then foundation copies the two files from `<folder>/hotfix-hf1/` (the bytes step 5 judged, by their sha256) into its worktree and lands them as its own signed commit under the set. If your trunk (`bash scripts/spine-ref.sh` names it) has moved since step 4's base, repeat steps 4 and 5 on the new base first.
7. **Propagate (B5).** From inside each module lane's worktree, `scripts/lane_currency_gate.sh`, then re-run step 2 for that lane and read back its HEAD.
8. **Check.** In foundation's worktree and in each lane, step 3's command now prints the **new** sha256 values in the table above.

## How it was tested
v2.7.2's engine with these two files in place was gated, battery-tested and walked like a release, on macOS. The release gate showed no failure beyond the four declared-residue lines it shows for v2.7.2, the adopter battery equalled its expected results, and the README walkthrough ran 85 steps with 0 failures. The commands in steps 1, 3, 4, 5 and 8 were run as written in a plain shell, not in a seat, on scratch repositories holding an unpacked v2.7.2 with no hooks installed and no permission rules in force, once with the trunk slot filled `main` and once with a trunk of another name, and printed what they say: the patch's tree id in step 5 equalled the one step 4 stated, and step 5 ended with its `PROVE:` line. With the two files deliberately damaged, step 5's `diff` printed the new red lines and the `PROVE:` line did not appear. The executor's own signed commit and push in step 4 run through its hooks, as the v2.7.2 walkthrough walked them. Since no permission rule was in force there, every line of every command block was also checked against the `Bash` deny rules of both settings files, v2.7.2's and this hotfix's, and none matches one. Steps 4 and 5 were not run in a seat. Steps 2, 6 and 7 are the shipped runbooks' own verbs, and were not walked for this hotfix.
