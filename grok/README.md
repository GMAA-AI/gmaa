# GMAA for Grok TUI (engine 2.5.7)

Governed Multi-Agent Architecture. Spec pin: canon v1.6.1. Engine: Grok companion 2.5.7.

This folder is the whole download. The plugin zip and the engine zip are here together.

## What is in this folder

- `README.md` (this file)
- `LICENSE.md`
- `GOVERNED_MULTI_AGENT_ARCHITECTURE_v1_6_1.pdf` (the spec)
- `ADOPTION-COVER.md` (adoption phases)
- `SHA256SUMS`
- `gmaa-engine-grok_v2.5.7.zip` (the engine)
- `gmaa-grok-plugin.zip` (`/gmaa-adopt`, `/restart`, agent defs, hooks)
- `GROK-BOT.md` (second route: give this to a Grok Bot as chat architect)

Second route: drop `GROK-BOT.md` in the project folder and give it to a Grok Bot. The numbered steps below stay the public walk.

## Prerequisites

The zip does not install Grok TUI. Install these on the machine before step 3.

- A Linux machine or a Mac (macOS 13+). Windows: WSL2 with a POSIX shell.
- An xAI Grok account on a paid plan (Pro, Max, Team, or Enterprise).
- Grok TUI: `grok --version`. If that fails:

```
curl -fsSL https://x.ai/cli/install.sh | bash
```

Then quit and reopen the terminal, run `grok --version` again, then `grok` once to sign in, then `/exit`.
- git (`git --version`) and a GitHub account
- tmux (`tmux -V`). Linux: `sudo apt install tmux`. Mac: `brew install tmux`.

## 1. Check the download

```
shasum -a 256 -c SHA256SUMS
```

Every line must say OK.

## 2. Make the project folder

Create a folder wherever you want the project to live. Lowercase, no spaces. That name is the git repo name.

Copy into that folder:

- `gmaa-engine-grok_v2.5.7.zip`
- `gmaa-grok-plugin.zip`
- `ADOPTION-COVER.md`
- the spec PDF
- this README and `LICENSE.md` if you want them there
- `GROK-BOT.md` if you are using the Grok Bot route

Leave the zip as a zip.

## 3. Install the plugin from that folder

Unzip the plugin zip first (it unpacks `gmaa-grok-plugin/`). Leave the engine zip as a zip.

```
unzip gmaa-grok-plugin.zip
grok plugin install ./gmaa-grok-plugin --trust
```

## 4. Chat (do this first)

You should already be talking with chat about the project. Create a Grok project for it. If you have not, put that conversation in the project's chat.

If there is no spec yet, tell chat: from this project, figure out which architect role it is (Product Architect or Solution Architect), then write a comprehensive functional spec and a spec-to-code for this effort, at least for version one.

**Evaluator block.** The engine creates the repository at instantiation (no prior version control is required). Empty substrate slots are a designed posture; SLOTS.md inventories them. Discipline is wired (hooks, probes, generation); the recurring human act is one ratification line per set. Assessing fit: read the cover, then the engine map (`docs/ENGINE-MAP.md`).

When that spec work is complete, give chat the canon (`GOVERNED_MULTI_AGENT_ARCHITECTURE_v1_6_1_PUBLIC.md` or the spec PDF) and `ADOPTION-COVER.md`. Ask:

> *Read `GOVERNED_MULTI_AGENT_ARCHITECTURE_v1_6_1_PUBLIC.md` and `ADOPTION-COVER.md`. Is GMAA a good fit for this project? Assess only. Do not implement anything yet.*

Nothing is built yet.

After the assessment, you choose. If it is a good fit, you may adopt or you may stop. Say so explicitly if you adopt.

If you adopt, the chat architect breaks the project into the instantiation documents as those documents instruct (`docs/FOUNDATION.md` and `seats.yaml`). Put the two fills in the same project folder as the zip and the plugin.

Leave work-package distribution to Foundation once the engine is running. That is the optimal path: Foundation issues packages in short increments so seats do not sit idle. You may still ask chat to sketch phases if you want a map; Foundation still cuts and issues the packages.

## 5. Instantiate

From that folder, type `grok` and press Enter. Give it:

```
Read docs/FOUNDATION.md, seats.yaml, and ADOPTION-COVER.md.
Instantiate this project per canon §12.
```

Follow what it asks. When instantiate is done, type `/exit` in that `grok` session. Then install the git hooks from the worktree it used:

```
bash scripts/install_pre_commit_hook.sh && bash scripts/install_post_commit_hook.sh
```

Confirm the opened package: `shasum -a 256 -c MANIFEST.sha256` (every line OK).

## 6. Run the seats

From inside a lane folder:

```
./launch-orc.sh
```

Or: `scripts/orc-up.sh <lane>`. Watch for `BOOT-ACK` and `BOOT-CHECK`.

Restart later with `/restart` (or say restart), then `scripts/orc-restart.sh <lane> --force`.

## Licenses

- Specification (canon): CC BY 4.0.
- Engine and plugin: Apache 2.0 with the Commons Clause. See LICENSE.md.

Copyright Israel Heskiel. https://gmaa.ai. Cite by version (engine 2.5.7, canon 1.6.1).
