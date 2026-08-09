# GMAA: Governed Multi-Agent Architecture · Engine

**Package v2.5.3 · Canon pin v1.5 · Canonical: [gmaa.ai](https://gmaa.ai) · Repository: [github.com/gmaa-ai/gmaa](https://github.com/gmaa-ai/gmaa) · Cite by version.**

GMAA is a governance layer for multi-agent systems. The unit of authorization is the set, not only the individual change. Individual changes are still approved one at a time; on top of that, GMAA adds a gate over the whole set. An accountable human ratifies the complete set of pending changes against the system's invariants before any of them commits, because a failure can live in the set even when every change was individually approved. GMAA places one writer over each coherence boundary, assembles the concurrent pending work, and puts an accountable seat, independent of every agent, over the whole set before commit.

This package is the **engine**: a generic, blank-copy instantiation of the architecture's production machinery, ready to be laid into your project's repository and instantiated for your project. It is derived from a live production system and genericized. It is not a proposal.

## What is in the box

This release comes in two parts. The readable docs and the free specification sit loose at the repository root, so you can read them before you download anything. The engine machinery is one sealed zip you download and verify. `SHA256SUMS` at the root lists the sha256 for the zip and for each loose file.

**Loose at the root, read without downloading:**
- **`ADOPTION-COVER.md`, read this first.** The four-phase adoption flow (fit assessment, then your adoption gate, then instantiation fills, then implementation), the two-kinds-of-steps split, and the non-skippable step-8 proof. Hand this and `canon/` to your chat session to assess fit and decide adoption.
- `GETTING-STARTED-LINUX-MAC.md`: a zero-to-running walkthrough for Linux and Mac. A Windows and WSL guide ships in a future release.
- `canon/`: the specification (v1.5) and the coherence-session-law addendum, the rulebook. Free to read and cite under CC BY 4.0, without touching the engine download.
- `LICENSE.md`, `CHANGELOG.md`, `CITATION.cff`: the license, the version history, and the citation metadata.
- `OPERATOR-GUIDE.md`, `OPERATOR-CHAT-SETUP.md`: the human-side guides for running a program and setting up the chat side.

**The engine zip (`gmaa-engine_v2.5.3.zip`), download and verify:** the machinery you run. `scripts/` for lane resolution, launch, sync, validation, and audit; `.claude/` for the agent fleet and settings; `agents/` for the auditor layer; `contracts/` and `schema/`; `_boot/`, `_knowledge/`, `_escalations/`, `dispatch/`; `CLAUDE.md` and `disciplines.md`; and `docs/FOUNDATION.md`, the skeleton your architect instantiates. `MANIFEST.sha256` inside the zip carries per-file integrity for the machinery; run it after you unzip.

Two files are **not** in the box because they are yours. `docs/FOUNDATION.md` is filled for your project, and `seats.yaml`, your lane roster, is written for your project. Both are produced in the chat-architect consultation described below. The genesis runbook is not shipped either. It is the canon's own §12 checklist, rendered step for step at instantiation (see "Instantiation follows the canon").

**Bringing it together in your project.** Loose at the root does not mean absent from your project. At setup you unzip the engine into your project folder and drop `canon/` and the reader docs in beside the machinery, so the engine and the docs sit together for genesis. The getting-started walkthrough covers this step by step.

## Prerequisites (the substrate floor)

Install these first. The engine does not provision them: **Claude Code CLI**, **git** with a GitHub account, and **tmux**. On Windows this implies **WSL2** with a POSIX shell. Verify each responds on your PATH before Phase 0. This release targets adopters who clear this floor.

Check the whole floor in one line, or run the bundled check:

```
claude --version && git --version && tmux -V
bash scripts/preflight.sh
```

## Getting started

**New adopter? Read `ADOPTION-COVER.md` first.** It walks the fit assessment, the adoption gate, and instantiation. The steps below summarize it.

1. **Verify the package.** Check the engine zip's sha256 against its line in `SHA256SUMS`, unpack it, and run `sha256sum -c MANIFEST.sha256` inside. `SHA256SUMS` also carries a sha for the loose canon and docs.
2. **Read `canon/` first, then `CLAUDE.md`.** The architecture governs the engine, not the other way around. Every instantiating session follows the canon to the letter (see "Instantiation follows the canon" below).
3. **Chat-architect consultation.** Attach two files to your chat session: the canon, `canon/GOVERNED_MULTI_AGENT_ARCHITECTURE_v1_5.md`, and `ADOPTION-COVER.md`. Then ask it, in these exact words:

   > *Read `GOVERNED_MULTI_AGENT_ARCHITECTURE_v1_5.md` and `ADOPTION-COVER.md`. Is GMAA a good fit for this project? Assess only. Do not implement anything yet.*

   If it assesses a good fit, it asks whether you want to adopt. If you say yes, it fills out your two project docs for you to deposit in the project folder: `docs/FOUNDATION.md` (your domain invariants, substrate, and the three auth paths, canon §12 steps 1 and 2) and `seats.yaml` (your lane roster with role bindings and allow-list profiles, canon §12 step 3). These are the only project-specific inputs.
4. **Create the project folder.** Create your code root, then a project folder named in **lowercase with no spaces** (this becomes the repository name). Unzip the engine into it, and place `canon/` and the reader docs beside the machinery, along with your two fills.
5. **Run genesis.** From inside the project folder, start a vanilla `claude` session and tell it to instantiate the project per the canon's §12 checklist. It stands up the foundation lane. That lane's worktree folder is named `foundation` and is checked out to the `main` branch (**folder equals lane; `main` is a branch, never a folder name**). It places the file set, verifies `sha256sum -c MANIFEST.sha256`, and reports. It follows the canon step for step and halts loudly on anything it cannot verify.
6. **Foundation provisions the rest.** The foundation seat boots with identity and provisions every other lane from `seats.yaml`. Foundation is the only self-provisioned lane at genesis. All others are stood up by foundation.
7. **Prove the governance before trusting it.** Run the seeded-fault cycle (the step-8 catch). The reconciliation gate must fire on a deliberately withheld artifact. If it passes without firing, the gate is broken. Fix it before relying on it.
8. **Optional, after instantiation.** Activate the code-substrate architect seat. The chat architect and code architect are the same role on two substrates, never occupied concurrently. The code architect joins the communication circle by doorbell, reachable only by the foundation seat and the operator.

## Instantiation follows the canon, to the letter

Genesis has no persona and no discretion. The chat-architect consultation and the vanilla genesis session both work **only** from the canon (`canon/`) and your operator-supplied facts. They invent nothing, add no step the canon does not name, and reorder nothing in a way that changes meaning. An unknown goes to the operator, never a guess. Any mismatch, whether a failed hash, a missing file, or an instruction that cannot be verified, stops the run with a named reason. Nothing proceeds past an unverified precondition. The genesis runbook is not a shipped file. It is the canon's own instantiation checklist (canon §12), rendered step for step. **Canon is authoritative. Where anything disagrees with canon, canon governs and the other thing is the defect.**

## Licensing (open spec, internal-use engine)

- **The specification (`canon/`) is free.** CC BY 4.0, attribution required, cite by version.
- **This engine is source-available for internal use only.** PolyForm Internal Use 1.0.0. Use it and adapt it for the internal operations of you and your company. You may not distribute it, sublicense it, or provide it or works based on it to anyone outside your organization. See `LICENSE.md`.
- **Operational graduation is the licensor's service.** Turning this engine into a running governed fleet for your specific project. Reach: arch@gmaa.ai.

## Integrity and versioning

Two axes, always stated together: the package version (this release: v2.5.3) and the canon pin (v1.5, by sha). Every content change is a version bump. Nothing is rebuilt in place. Verify fingerprints from disk. If a verification fails, stop and report. Do not proceed on a package that does not prove itself.

By Israel Heskiel. Built and run in production. Canonical: gmaa.ai.
