# Adopting the Governed Multi-Agent Architecture: Read This First
**Accompanies canon `GOVERNED_MULTI_AGENT_ARCHITECTURE_v1_6_1_PUBLIC.md` (v1.6.1) · Engine package v2.5.6**

**Package contents:** this cover · `canon/`, the architecture document (v1.6.1, which folds the coherence-session law into its body as the fifth universal invariant) · `README.md` (engine quick guide plus the prerequisites floor) · `AGENTS.md` (read automatically by your coding agent) · `docs/FOUNDATION.md` (skeleton you fill) · the governance machinery (`scripts/`, `.grok/`, `agents/`, `contracts/`, `schema/`, `_boot/`, `_knowledge/`, `dispatch/`) · `LICENSE.md` · `MANIFEST.sha256` (verify before use). During adoption you author two project fills: `docs/FOUNDATION.md` and `seats.yaml`.

You have been handed a reference architecture for running multiple AI agents (and people) against one codebase without individually correct changes combining into broken systems. It runs in production in three programs. You are being asked to test whether it adopts cleanly in yours.

**The adoption runs in four phases: assess, then your explicit go, then instantiation fills, then implementation. The phases are mandatory and ordered. Where they run is your choice.**

- **Chat path (recommended).** Phases 1 through 3 in a chat session, Phase 4 in Grok TUI. Recommended for everyone, not just non-terminal people. The session that judges fit and records your decisions is a different session from the one that implements them, which is this architecture's own author and executor separation applied to its own adoption. The implementing agent then verifies a document it did not write.
- **Code-only path (supported alternative).** All four phases in one Grok TUI session, for operators who work solely via CLI. Same phases, same gate, same fills. Here the assessor and the implementor are the same session, so the fills are the only record carrying the gate, and the session must deliberately re-verify its own output before implementing. This is tolerable only because both are the *same seat's phases in sequence*, never two seats' roles at once (see the fifth universal invariant, ONE-SESSION-ONE-SEAT, in canon §2, which no path may violate).

## Instantiation follows the canon, to the letter
Every session in this adoption, the assessing chat session and the implementing coding session, works **only** from the canon (`canon/`) and your operator-supplied facts. It invents nothing, adds no step the canon does not name, reorders nothing in a way that changes meaning, and sends unknowns to you rather than guessing. Any mismatch, whether a failed hash, a missing file, or an instruction it cannot verify, stops the run with a named reason. **Canon is authoritative. Where anything disagrees with canon, canon governs.**

## Phase 0: Set up the adoption folder (you)
Meet the substrate floor in **README, "Prerequisites"** first (Grok TUI, git plus GitHub, tmux; on Windows this means WSL2). **Then** create your project folder at your code root, named in **lowercase with no spaces** (this becomes the git repository name), and put **all the package files** in it. This folder is where everything lands: package, decisions, and eventually the generated governance files. Phases 1 through 3 run in a browser chat and need nothing installed, so setup can happen in parallel.

**Topology (stated once, implied everywhere):** your Phase-0 folder is the PARENT. Copy the zip
and fills into it; do not mkdir `foundation/` and do not unzip. Vanilla instantiate creates
`<parent>/foundation/`, runs `git init` there, and checks `foundation` out to `main` (folder
equals lane; `main` is a branch, never a folder name). Instantiation creates the writer; every
other seat is created by ruling, later, on demand. Every further lane is a sibling worktree
`<parent>/<lane>` created with `git worktree add` after an operator ruling. Every worktree
carries its own `scripts/` + `launch-orc.sh` (spine paths, propagated by currency-sync, never
hand-copied); hooks are installed ONCE from any worktree (common git dir); launch ONLY from
inside a lane folder.

## Phase 1: Assessment (nothing is built)
**Chat path:** upload the canon (the architecture document), this cover, and, if your project is already thought out, your project's spec to a chat session (a Grok project chat works well). **Code-only path:** start Grok TUI yourself in the adoption folder (type `grok`) and ask the assessment question in your own words. Either way, ask from whichever posture is yours. For **an existing project**, ask "will this framework work with my project?" For **a new idea**, ask "help me shape this idea and assess whether building it under GMAA fits." Both flow into the same gate:

> *"Read `GOVERNED_MULTI_AGENT_ARCHITECTURE_v1_6_1_PUBLIC.md` and `ADOPTION-COVER.md`. Is GMAA a good fit for this project? Assess only. Do not implement anything yet."*


**Feasibility (do not miss these three facts).** The engine creates the repository at instantiation, so no prior version control is required; an ungoverned workspace is the starting condition, not a blocker. Empty substrate slots are a designed posture, not gaps: SLOTS.md is the inventory of those decisions. Enforcement is wired into hooks, probes, and generation, so the recurring human cost is the ratification line, not ceremony.

**Assessing fit? Read the engine map next** (`docs/ENGINE-MAP.md` in the package, or `ENGINE-MAP.md` beside this cover). The cover stays a router. It does not become the map.


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
Phase 3 closes only on the complete fill set (`docs/FOUNDATION.md` + `seats.yaml` + the instantiation relay) reviewed as a set by one session for joint coherence.


## Phase 4: Implementation (coding agent, prompted by you)
From inside the adoption folder, start a vanilla `grok` session and tell it to instantiate the project per canon §12 (the first instantiation is always a vanilla `grok` session, not the launcher, which only boots seats that already exist; code path: give the instruction yourself):

> *"Read `docs/FOUNDATION.md`, `seats.yaml`, and `ADOPTION-COVER.md` and instantiate this project per canon §12. Layout: this folder is the parent; vanilla instantiate creates `<parent>/foundation/` (`git init` there; engine files live there, checked out to `main`). Stand up the foundation lane only: git init, foundation worktree and stamp, generated files, first commit, STOP. Do not create executor or any other lane. Do not launch anyone."*

The agent verifies the fills and stands up the **foundation lane** (the writer). That lane's worktree folder is named `foundation` and is checked out to the `main` branch (**folder equals lane; `main` is a branch, never a folder name**; the Phase-0 topology above - the agent does not guess the layout). It verifies `sha256sum -c MANIFEST.sha256`, then generates the governance files (canon §12 steps 3 through 6: seat instructions, probes, register, the relay channel (relay-inbox/relay-outbox), all generated, never hand-written), makes the genesis commit, and **stops**. Vanilla never launches; launch is the operator's act. **Configure a git remote immediately after genesis** (before treating the repository as origin-durable). Every other seat is created by ruling, later, on demand: operator rules a lane (boundary in one sentence); charter precedes provisioning; foundation provisions and commits exactly one lane as one set (`scripts/seat-add.sh`); the operator launches via `./launch-orc.sh` and verifies the header. **`seats.yaml` is intent, not authorization; no seat holds two of the four parts.** See GETTING-STARTED (lane stand-up protocol) and OPERATOR-GUIDE. From then on foundation carries the SET DUTY (canon §4): module work reaches `main` only inside a set foundation assembles and the named human ratifies (`scripts/ratify.sh`; AGENTS.md binding invariant #6).

**Step 8 is non-skippable and must not pass on a clean run.** One full cycle with a *deliberately seeded fault*, a planted conflict the machinery must detect, name, hold, and recover. A clean first run proves nothing. A caught seeded fault proves the control exists. Skip it and you have installed vocabulary, not governance. The package ships seeded-fault proofs you can run first: `bash scripts/test/test_resolve_lane_seeded_fault.sh` (a hand-made folder or a mis-stamped worktree must HALT and must not mint a seat; includes a positive control), `DISCRIMINATION_PROVE_FAIL=1 bash probes/discrimination_proof_neutral.sh` (the probe harness must be able to say FAIL), `bash scripts/test/test_set_gate_seeded_fault.sh` (the full set-authorization battery - uncovered spine commits REJECTED, non-member merges HALTed, every gate seen to fail on a planted fault), and the two set-gate FLIP probes under `probes/set-gate/`. Your own step 8 seeds a fault in YOUR governed flow, not only these.

## Upgrading
Foundation runs the engine update; see `docs/ENGINE-UPDATE.md`. (Classified diff, never an
overwrite; a moved slot STOPs for the operator; the update itself rides a ratified set.)

## Feedback (welcome, not required)
The engine is field-proven, not finished. The most valuable things to send back to **arch@gmaa.ai**:
1. **Friction notes.** Every place a document was ambiguous, silent, wrong for your stack, or made you or the agent guess. These drive the next revision.
2. Your **step-8 result.** What fault you seeded, and whether the machinery caught it.
3. Any **incident** during adoption, something that broke, drifted, or got caught. Incidents are the most valuable return of all.
4. Optional: send your instantiation for a **reconciliation review**, a structured diff against the source naming every delta. This is how the three existing programs were conformed.

## Chat surfaces are ungoverned context
A chat project is not a worktree. Its instructions and knowledge files are ferried snapshots, not HEAD. The pin on every chat-authored executable artifact, the refuse/HALT gate (`scripts/verify_artifact_pin.sh`), the Phase-3 set review, and the `scripts/sync_knowledge.sh` loop are the manual bridge across that gap. The structural cure is governed-context, and it is a design-stage problem; this revision does not claim to have solved it.

## Ground rules
- **Licensing:** the canon (`canon/`) is **CC BY 4.0**. Cite the version (v1.6.1) in your instantiation files. The engine is **Apache License 2.0 with the Commons Clause**: source-available; use, modify, and redistribute freely, including commercially, but you may not Sell it. Your own instantiation files are yours. See `LICENSE.md`.
- Nothing in this architecture claims its conflict detection is complete (canon §13). If your step-8 fault slips through, that is not embarrassing. That is exactly the data the completeness protocol exists to collect. Report it as-is.

## Terminology mapping (for your context)
The document uses a compact vocabulary; these field synonyms are equally correct, so use whichever fits your organization.
**seat becomes agent** (a governed agent role bound to one session) · **foundation becomes integrator or orchestrator** (the sole-committer spine role). v1.6.1 conformed the document's own naming: it uses **project** throughout (including {project}-{lane}) and **cross-project** for the DMZ protocol (abbreviated XP), so no program-to-project translation is needed when reading the canon. Your generated files may use either the canon's terms or your organization's synonyms, consistently.

*Questions, returns, and review requests go to arch@gmaa.ai.*
