# Governed Multi-Agent Architecture (GMAA)

A reference architecture for running multiple AI agent seats and multiple human operators against a single codebase, such that no change lands without authorization at the correct unit, no claim closes without evidence, and no failure degrades silently.

## What you get

`ENGINE-MAP.md`, at the root of the engine zip, lists every file in the engine and what it does, and marks the core files every seat reads end to end before its first act; if a file is not listed there, it is not part of the engine.

A project where several agents (and the people directing them) write to one codebase and the trunk stays under control: one writer, every seat signing its own commits, a human ratifying each complete change-set, an auditor after every commit, agents that halt by name instead of improvising, and a record a new session boots from in minutes. After genesis the writer seat provisions every other seat on your roster, one set each that it lands on your go; genesis is complete when the roster exists and a fault you planted was caught. `WHY-GMAA.md` says what it is, what it costs and when it fits.

## The correction

Multi-agent systems fail by authorizing at the wrong unit: individual changes get approved while the coherence of the complete pending set goes unexamined. GMAA adds set-level authorization on top of per-change review, never instead of it. Both gates fire: each change is still reviewed on its own, an integrator agent assesses the complete pending set as a unit against the system's logic, evidence, live state, and invariants, and an independent human then ratifies that assessed set before any member commits.

## Two artifacts, two licenses

- The **specification** (the canon) is the free, citeable standard, licensed CC BY 4.0. Read it at https://gmaa.ai/canon.html or in the engine zip as `GOVERNED_MULTI_AGENT_ARCHITECTURE_v1_6_9.md`. Current canon: v1.6.9.
- The **engine** is the runnable implementation in this repository, source-available under the Apache License 2.0 with the Commons Clause: free to use, modify, and redistribute, including commercially, but you may not sell it or offer it as a paid or hosted service. See LICENSE.md.

Canonical home for both: https://gmaa.ai. Cite by version.

## What is in this release

- README.md (this file)
- README.rtf (this file as rich text, for readers without a Markdown viewer)
- LICENSE.md (the engine license, and the canon's separate CC BY 4.0 grant)
- The engine package (zip): the genericized architecture, with the canon carried in the zip, ready to instantiate per project
- The decision kit (zip): four files for the Phase 1 decision, a paste for a chat session, `WHY-GMAA.md`, the canon and the adoption cover, byte-equal to their copies in the engine zip
- MANIFEST.sha256 and PROVENANCE.tsv (the package's file fingerprints and the source of every file; the same two files are inside the zip)
- SHA256SUMS (the fingerprint of every other file in this list)

This release's route is the zip and `genesis.sh`. It ships no plugin; where the canon's §11 speaks of a plugin, this package is not it.

The current engine version and its verification fingerprints are published at https://gmaa.ai/versions.html.

## Prerequisites (the substrate floor)

The engine assumes a working substrate. It is a stated prerequisite, not auto-provisioned:

- Claude Code CLI, version 2.1.302 or later (the version this package is built and tested against; the engine's settings keep Claude Code from updating below it but do not stop an older install from starting, so check with `claude --version`)
- git
- a git remote for the spine: a private hosted repository (GitHub or any other host) or a bare repository on the same machine
- tmux
- python3 with its `yaml` module, PyYAML (the boot check and several probes run on python3; the seat-definition probe, the build-class check and the code auditor import `yaml`)
- jq (the boot check, the boot record and the stop hook read JSON with it; without it they degrade, and the lines they print do not name jq: the boot record prints nothing)
- OpenSSH with `ssh-keygen -Y` signing (every seat signs with its own ed25519 key)
- perl (the boot check uses it; without it, one boot count prints UNREADABLE instead of a number)
- macOS 13 or later, or Ubuntu, on its own or under WSL2 on Windows (on Windows, every step runs inside the Ubuntu terminal)

## Quick start

Two downloads sit beside each other on this page: `gmaa-decide_<version>.zip` (four files: a paste for a chat session, `WHY-GMAA.md`, the canon, the adoption cover) and `gmaa-engine_<version>.zip` (the engine). Verify each against SHA256SUMS before use.
1. Decide: open a new chat session, attach the kit's three documents, paste its first file (`00-PASTE-THIS.txt`), and read the session's answer. Nothing is built until you say yes.
2. Adopt: create your project folder (its name is your project token), unzip the engine into `foundation/` inside it with a tool that keeps file modes (`unzip` does), and confirm integrity from inside it: `sha256sum -c MANIFEST.sha256` (every line must report OK, or stop and report).
3. Fill: go back to the same session for the fills (the cover's Phase 4 line); it returns `FOUNDATION.md`, `seats.yaml`, `COORDINATION.md`, `genesis.conf` and one definition per subagent, which you place in `foundation/` as the cover says.
4. Genesis: `bash genesis.sh` in `foundation/`. One command; it ends in the writer seat's launch, and the writer then builds every other seat on your roster. The cover (`ADOPTION-COVER.md`) is the five phases; the guide (`GETTING-STARTED-LINUX-MAC.md`) is every keystroke from a blank machine; `FIRST-SET.md` is what comes after.

The canon carries the instantiation checklist (section 12), including the seeded-fault run (step 8) that proves the controls exist; `genesis.sh` is that checklist's onboarding verb in command form (canon section 11).

## Verify

Every download is cited on two axes together: the engine package version and the canon pin (the specification version the engine ships and conforms to). Verify on both surfaces before use: run `sha256sum -c SHA256SUMS` to confirm the release files (the engine zip, this README in both formats, LICENSE, the manifest and the provenance), then unzip and run `sha256sum -c MANIFEST.sha256` to confirm the package contents, including the canon (pin v1.6.9). The decision kit's three documents are byte-equal to their copies in the engine zip, and the kit's own fingerprint is in SHA256SUMS. Fingerprints for the current release are on https://gmaa.ai/versions.html.

## License summary

- Specification (canon): CC BY 4.0, attribution required.
- Engine (this repository): Apache 2.0 with the Commons Clause, source-available.

Copyright Israel Heskiel. Canonical home: https://gmaa.ai. Cite by version.
