# Adopting the Governed Multi-Agent Architecture: Read This First
**Accompanies canon `GOVERNED_MULTI_AGENT_ARCHITECTURE_v1_5.md` (v1.5) · Engine package v2.5.3**

**Package contents:** this cover · `canon/`, the architecture document (v1.5) **and `COHERENCE-SESSION-LAW_addendum.md` (binding: read in full, it carries the law the whole architecture exists for)** · `README.md` (engine quick guide plus the prerequisites floor) · `CLAUDE.md` (read automatically by your coding agent) · `docs/FOUNDATION.md` (skeleton you fill) · the governance machinery (`scripts/`, `.claude/`, `agents/`, `contracts/`, `schema/`, `_boot/`, `_knowledge/`, `dispatch/`) · `LICENSE.md` · `MANIFEST.sha256` (verify before use). During adoption you author two project fills: `docs/FOUNDATION.md` and `seats.yaml`.

You have been handed a reference architecture for running multiple AI agents (and people) against one codebase without individually correct changes combining into broken systems. It runs in production in three programs. You are being asked to test whether it adopts cleanly in yours.

**The adoption runs in four phases: assess, then your explicit go, then instantiation fills, then implementation. The phases are mandatory and ordered. Where they run is your choice.**

- **Chat path (recommended).** Phases 1 through 3 in a chat session, Phase 4 in Claude Code. Recommended for everyone, not just non-terminal people. The session that judges fit and records your decisions is a different session from the one that implements them, which is this architecture's own author and executor separation applied to its own adoption. The implementing agent then verifies a document it did not write.
- **Code-only path (supported alternative).** All four phases in one Claude Code session, for operators who work solely via CLI. Same phases, same gate, same fills. Here the assessor and the implementor are the same session, so the fills are the only record carrying the gate, and the session must deliberately re-verify its own output before implementing. This is tolerable only because both are the *same seat's phases in sequence*, never two seats' roles at once (see `canon/COHERENCE-SESSION-LAW_addendum.md` §1, which no path may violate).

## Instantiation follows the canon, to the letter
Every session in this adoption, the assessing chat session and the implementing coding session, works **only** from the canon (`canon/`) and your operator-supplied facts. It invents nothing, adds no step the canon does not name, reorders nothing in a way that changes meaning, and sends unknowns to you rather than guessing. Any mismatch, whether a failed hash, a missing file, or an instruction it cannot verify, stops the run with a named reason. **Canon is authoritative. Where anything disagrees with canon, canon governs.**

## Phase 0: Set up the adoption folder (you)
Meet the substrate floor in **README, "Prerequisites"** first (Claude Code CLI, git plus GitHub, tmux; on Windows this means WSL2). **Then** create your project folder at your code root, named in **lowercase with no spaces** (this becomes the git repository name), and put **all the package files** in it. This folder is where everything lands: package, decisions, and eventually the generated governance files. Phases 1 through 3 run in a browser chat and need nothing installed, so setup can happen in parallel.

## Phase 1: Assessment (nothing is built)
**Chat path:** upload the canon (the architecture document plus the COHERENCE-SESSION-LAW addendum), this cover, and, if your project is already thought out, your project's spec to a chat session (a Claude project works well). **Code-only path:** start Claude Code yourself in the adoption folder (type `claude`) and ask the assessment question in your own words. Either way, ask from whichever posture is yours. For **an existing project**, ask "will this framework work with my project?" For **a new idea**, ask "help me shape this idea and assess whether building it under GMAA fits." Both flow into the same gate:

> *"Read `GOVERNED_MULTI_AGENT_ARCHITECTURE_v1_5.md` and `ADOPTION-COVER.md`. Is GMAA a good fit for this project? Assess only. Do not implement anything yet."*

Two things happen in this phase, in order:
1. **The chat session determines its own role first.** Depending on where your project stands, it serves either as **Product Architect** (your project is itself a product or program whose architecture and governance it would custody) or as **Solution Architect** (it would be conforming one specific project to the framework). It states which role it is assuming and why. It must not assume a role by default, and if neither fits it says so.
2. **It assesses fit.** Where the framework maps onto your project cleanly, where it does not, and what an adoption would involve. The output is a judgment, not artifacts.

## Phase 2: The gate (you)
Nothing proceeds on a positive assessment alone. **You explicitly confirm the adoption** ("yes, adopt it"), or you stop here, and stopping here is a perfectly valid result. This gate is the architecture's own core rule applied to its own adoption: no execution before authorization.

## Phase 3: Instantiation fills (chat authors, you decide, you carry)
On your confirmation, the session produces your project's **decision-complete instantiation fills**. Three decisions are **yours, settled in conversation** (the session proposes, you rule):
- **Your invariants:** what must always hold true in your system (canon §12 step 1).
- **Your auth paths:** read-only identity, privileged human path, machine identities (canon §12 step 2).
- **Who ratifies:** the named human who approves complete change-sets (canon §12 step 7).

The session writes these, plus the substrate definition, into **`docs/FOUNDATION.md`**, and writes your lane roster into **`seats.yaml`** (canon §12 step 3; schema per seat: `lane · branch · role · spine_write`, with `spine_write: ALLOW` for foundation only). Both must be **decision-complete**: your coding agent must be able to implement them without asking you anything already answered. Chat path: download both and **drop them into the adoption folder** from Phase 0. Code path: the session writes them into the folder directly.

## Phase 4: Implementation (coding agent, prompted by you)
From inside the adoption folder, start a vanilla `claude` session and tell it to instantiate the project per canon §12 (chat path: `launch-orc.sh` serves this once the fills are present; code path: give the instruction yourself):

> *"Read `docs/FOUNDATION.md` and `seats.yaml` and instantiate this project per canon §12."*

The agent verifies the fills and stands up the **foundation lane**. That lane's worktree folder is named `foundation` and is checked out to the `main` branch (**folder equals lane; `main` is a branch, never a folder name**). It verifies `sha256sum -c MANIFEST.sha256`, then generates the governance files (canon §12 steps 3 through 6: seat instructions, probes, register, comms spool, all generated, never hand-written). Foundation then provisions every other lane from `seats.yaml`, and runs **step 8** with you.

**Step 8 is non-skippable and must not pass on a clean run.** One full cycle with a *deliberately seeded fault*, a planted conflict the machinery must detect, name, hold, and recover. A clean first run proves nothing. A caught seeded fault proves the control exists. Skip it and you have installed vocabulary, not governance.

## Feedback (welcome, not required)
The engine is field-proven, not finished. The most valuable things to send back to **arch@gmaa.ai**:
1. **Friction notes.** Every place a document was ambiguous, silent, wrong for your stack, or made you or the agent guess. These drive the next revision.
2. Your **step-8 result.** What fault you seeded, and whether the machinery caught it.
3. Any **incident** during adoption, something that broke, drifted, or got caught. Incidents are the most valuable return of all.
4. Optional: send your instantiation for a **reconciliation review**, a structured diff against the source naming every delta. This is how the three existing programs were conformed.

## Ground rules
- **Licensing:** the canon (`canon/`) is **CC BY 4.0**. Cite the version (v1.5) in your instantiation files. The engine is **PolyForm Internal Use 1.0.0**: internal use only, do not redistribute. Your own instantiation files are yours. See `LICENSE.md`.
- Nothing in this architecture claims its conflict detection is complete (canon §13). If your step-8 fault slips through, that is not embarrassing. That is exactly the data the completeness protocol exists to collect. Report it as-is.

## Terminology mapping (for your context)
The document's internal vocabulary predates its field use. Read it with this mapping. Both terms are correct; use whichever fits your organization.
**program becomes project** · **seat becomes agent** (a governed agent role bound to one session) · **foundation becomes integrator or orchestrator** (the sole-committer spine role) · **cross-program (XP) becomes cross-project protocol**. The architecture document itself retains the internal terms. Your generated files may use either consistently.

*Questions, returns, and review requests go to arch@gmaa.ai.*
