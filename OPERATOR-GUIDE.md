<!-- OPERATOR-GUIDE.md. Authored by the GMAA Application Packaging Architect seat, 2026-08-06. RELEASE ACCOMPANIMENT to gmaa-engine v2.5.3 (operator ruling 2026-08-06): distributed ALONGSIDE the sealed engine zip, not inside it. It is not in the engine manifest and does not alter the sealed bytes. The human-side companion to the engine's seat-side docs (CLAUDE.md B6, _knowledge/COORDINATION.md, contracts/SPEC-DOORBELL.md). Generic; no instance tokens. -->

# OPERATOR-GUIDE.md: running a GMAA program from the operator's chair

The engine's other documents teach the seats. This one teaches you. Everything here is the day-to-day mechanics of being the operator: what you ferry, what you say, when you restart things, and what to do when a seat stops.

## 1 · What you are, and are not
You are the apex: you make WHAT-class decisions (what to build, what to approve, what ships) and you transport artifacts. You do not commit, do not write code, do not resolve HOW-class questions. Your seats do that, and making them do it is what keeps the record honest. If a seat asks you a HOW question, send it back; if a seat makes a WHAT decision for you, overrule it on principle even if you agree with the content.

## 2 · One session, one seat
Every chat session is exactly one seat, and every terminal agent is exactly one seat. Never let one session speak for two seats, and never open the same seat twice at once. If you need another role, open another session. When a chat seat and a code seat exist for the same role (the architect can live on either substrate), only one of them is active at a time. Switch with a shutdown handshake (§5), never by running both.

## 3 · The ferry (chat seat to code seat, and back)
Chat seats have no filesystem. You are the filesystem between them and the code side.
1. The chat seat authors a **file** with a **versioned filename** (never a pasted wall of text; files survive, panes don't).
2. Download it and drop it at the code side's single drop point (the inbox your program designates: one drop point, not one per agent).
3. Say one sentence to the orchestrator seat: **"There is a new relay."** That is the whole doorbell. The orchestrator routes it hub-and-spoke from there; you never deliver to individual lanes.
4. Returns come back the same way: the code side writes a return file, and you upload it into the chat seat's session.
Rules that keep the ferry honest: never edit a relay in place (a correction is a new versioned file); if you ferry the same file twice, the seat answers once; if the seat's copy and disk disagree, disk wins, and the seat re-reads.

## 4 · Reading the code side without touching it
When a chat seat needs facts about a repository, it authors a read-only check (commands that only read); you ferry it; the code seat runs it and returns raw output. Never summarize on the seat's behalf, and never let a code seat "interpret" instead of returning bytes. The chat seat's job is judging evidence, and it can only judge what it can see verbatim.

## 5 · Stopping a code seat (the shutdown handshake)
Never just close a terminal on a working seat. The sequence:
1. **Warn the seat** you intend to shut it down.
2. The seat **externalizes its state** (writes anything held in context to disk) and confirms.
3. `/exit` ends the agent.
4. `exit` ends the shell and its tmux pane/session.
Skipping step 2 is how work held in a context window dies silently. The engine's seats are built restart-preferred (the repo is memory and the context window is only a workspace; see CLAUDE.md §B6), so a clean handshake costs minutes and loses nothing.

## 6 · Restarting things
- **Code seats:** restart at natural boundaries (work-package close, wave close). If a seat is past roughly half its context at a boundary, restart it rather than rolling on; never open new work above ~70%. Cold boot re-grounds from the repo and takes minutes. Use the handshake (§5), then relaunch. The launcher resolves the seat's lane from its folder (folder equals lane), so launching from the right worktree directory brings up the right seat.
- **Chat seats:** a new session boots the same seat fresh. Ferry it the current governing documents (its charter, the program's register, anything changed since the snapshot it holds), let it run its boot assessment, and expect it to name any drift it finds before doing work. A chat seat that starts authoring without a boot report is skipping its own discipline. Stop it and ask for the report.
- **Resuming mid-task:** prefer restart over long-lived sessions. A restarted seat that re-derives from disk is more trustworthy than a tired one that remembers.

## 7 · When a seat halts
Halting loud is correct behavior, not failure. A seat that stops and names a mismatch (a hash that doesn't verify, a file that isn't where the record says, an instruction that conflicts with its charter) is doing exactly what the architecture pays for. Your moves, in order: read what it named; if it's a fact question, get the evidence (usually a read-only check, §4); if it's a decision, make the WHAT-class call; then let the seat proceed or re-derive. Never instruct a seat to push through a halt "just this once." Every silent exception you grant becomes the precedent that breaks the next gate.

## 8 · Claims and receipts
A seat's statement that work is done is a claim. The bytes are the receipt. When something matters (a seal, a migration, a fix), have the receiving seat verify on its own evidence (hashes from disk, files re-read) before you treat it as done. If a receipt and the bytes ever disagree, the bytes win, the claim is retracted by name, and the record keeps the history rather than being rewritten clean.

## 9 · Channels, in one breath
Inside a program, relays run on that program's own numbered sequence. Between programs, use a cross-project channel with its own sequence. Either way: files, versioned names, one drop point, one doorbell sentence, orchestrator routes. You carry; you don't route.

## 10 · The habits that keep it healthy
Batch your rulings (one decision pass beats a dribble of small ones). Keep seats in their lanes even when crossing would be faster today. Let the record grow only on incidents with receipts. Resist adding rules because something *might* go wrong. And when the machinery catches one of your own errors, let it stand in the record; the catches are the proof the system works.

Generic operator's guide, GMAA engine. Companion to the seat-side docs; teaches the chair, not the seats.
