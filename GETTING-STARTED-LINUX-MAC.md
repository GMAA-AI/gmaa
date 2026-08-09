# Getting Started: Linux and Mac
**Setting up on a Linux or Mac machine. A Windows and WSL guide ships in a future release.**

This walks you from a blank machine to a completed adoption, assuming you have never used a terminal. The adoption runs in four phases (see `ADOPTION-COVER.md`): assessment and design happen **in chat**, implementation happens **in Claude Code**. If you **already have Claude Code installed, skip straight to Step 5.**

## What you need before starting
- A Linux machine with a POSIX shell, or a Mac (macOS 13 or later)
- A Claude account with a paid plan (Pro, Max, Team, or Enterprise). Sign up at claude.ai if needed.
- All the files that came with this package (unzip it somewhere you can find)

## Step 1: Check whether Claude Code is already installed
1. Open your terminal. **Linux:** open your terminal app. **Mac:** press **Cmd + Space**, type **Terminal**, press **Enter**.
2. Type exactly `claude --version` and press **Enter**.
3. If you see a version number (like `2.x.x`) you have it. **Skip to Step 5.**
4. If you see `command not found`, continue to Step 2.

## Step 2: Install Claude Code
1. In the same terminal, copy and paste this single line, then press **Enter**:
   ```
   curl -fsSL https://claude.ai/install.sh | bash
   ```
2. Wait for it to finish (a minute or two on a normal connection). No password should be needed.
3. **Quit the terminal completely and reopen it.** This is required so it finds the new command.
4. Type `claude --version` and press **Enter**. A version number means success. If not, type `claude doctor` and follow what it says, or see Troubleshooting.

**Also install tmux** (fleet sessions, needed when you operate after adopting). **Linux:** `sudo apt install tmux` (or your distro's package manager). **Mac:** `brew install tmux`. Confirm with `tmux -V` and `git --version`.

## Step 3: Sign in once
1. Type `claude` and press **Enter**.
2. First launch walks you through setup. Pick a theme (any), and when it asks about signing in, choose your **Claude account**. A browser window opens; sign in and approve.
3. Type `/exit` and press **Enter**. The real launch comes later, in Phase 4.

## Step 4: Create the project folder (Phase 0)
1. Create the folder your project will live in, at your code root. Name it **lowercase, with no spaces**. This becomes your git repository name.
2. Unzip the engine zip into that folder, then copy the loose `canon/` folder and the docs (`README.md`, `ADOPTION-COVER.md`, `CLAUDE.md`) in beside it, so the engine and the docs all sit together in the project folder.

## Step 5: Run Phases 1 through 3 (choose your surface)  *(skip-to point if you already had Claude Code)*
1. Read `ADOPTION-COVER.md` yourself first. It is one page, and it explains the four phases and which decisions are yours.
   **The chat path below is the recommended route.** The session that assesses and records your decisions stays separate from the one that implements them. (Work solely in the terminal? A Code-only alternative exists, described in the cover, but if you are unsure, use the chat path.) Continuing here:
2. In a chat session (a Claude project works well), upload the **architecture document** (`canon/`), the **cover**, and, if your project is already thought out, your project's spec. Ask:
   > *Read `GOVERNED_MULTI_AGENT_ARCHITECTURE_v1_5.md` and `ADOPTION-COVER.md`. Is GMAA a good fit for this project? Assess only. Do not implement anything yet.*
3. The chat states which architect role it is assuming and gives you a fit assessment. **If you decide to adopt, say so explicitly.** Nothing proceeds until you do (Phase 2).
4. Work through your three decisions in conversation (invariants, auth paths, who ratifies), and have the chat write your two decision-complete fills: **`docs/FOUNDATION.md`** and **`seats.yaml`**.
5. **Download `docs/FOUNDATION.md` and `seats.yaml` and drop them into the project folder** from Step 4.

## Step 6: Launch the implementation (Phase 4)
1. In the terminal, type `cd ` (c, d, one space; do not press Enter), drag the project folder onto the terminal window, and press **Enter**.
2. Type `bash launch-orc.sh` and press **Enter**. The launcher checks the fills are in place and starts a session to instantiate the project per canon §12. It stands up the **foundation lane**. That lane's worktree folder is named `foundation` and is checked out to the `main` branch (folder equals lane; `main` is a branch, never a folder name).
3. **The seat boots directly into its announcement.** Watch for `BOOT-ACK: ...`; that first turn is the only launch proof. (Shown for reference; the launcher delivers the instruction for you.)
   ```
   Read docs/FOUNDATION.md and seats.yaml and instantiate this project per canon §12.
   ```
4. The agent verifies the fills and generates the governance files, then foundation provisions the other lanes from `seats.yaml`. If it halts naming a missing decision, that is it working correctly. Go settle the decision. Do not work around the halt.

## Step 7: The proof (do not skip)
Run the seeded-fault test (canon §12 step 8) with the agent. It plants a deliberate conflict, and the machinery must detect, name, hold, and recover it. **A clean run proves nothing.** Note what was seeded and whether it was caught.

## Step 8: Feedback (welcome)
`ADOPTION-COVER.md` lists what is most useful to send to arch@gmaa.ai, above all every place you or the AI had to guess.

## Troubleshooting
- **`command not found` after installing:** you did not reopen the terminal (Step 2.3). Or run `claude doctor`.
- **`permission denied` running the launcher:** use `bash launch-orc.sh`, not `./launch-orc.sh`.
- **The launcher says the fills are not there yet:** this is not an error. Finish the chat phases and drop `docs/FOUNDATION.md` and `seats.yaml` in, or take the Code-only path in the cover.
- **Install seems blocked:** on company-managed Macs, security policy may interfere. Ask IT, or see the official docs.
- **Never want to touch a terminal?** The Claude Desktop app includes Claude Code without the terminal (claude.com/download). The chat phases already run in chat by design.
- Official install docs: https://code.claude.com/docs/en/setup
