# Governed Multi-Agent Architecture (GMAA)

A reference architecture for running multiple AI agent seats and multiple human operators against a single codebase, such that no change lands without authorization at the correct unit, no claim closes without evidence, and no failure degrades silently.

## The correction

Multi-agent systems fail by authorizing at the wrong unit: individual changes get approved while the coherence of the complete pending set goes unexamined. GMAA adds set-level authorization on top of per-change review, never instead of it. Both gates fire: each change is still reviewed on its own, an integrator agent assesses the complete pending set as a unit against the system's logic, evidence, live state, and invariants, and an independent human then ratifies that assessed set before any member commits.

## Two artifacts, two licenses

- The **specification** (the canon) is the free, citeable standard, licensed CC BY 4.0. Read it at https://gmaa.ai/canon.html or in the engine zip as `GOVERNED_MULTI_AGENT_ARCHITECTURE_v1_6_8.md`. Current canon: v1.6.8.
- The **engine** is the runnable implementation in this repository, source-available under the Apache License 2.0 with the Commons Clause: free to use, modify, and redistribute, including commercially, but you may not sell it or offer it as a paid or hosted service. See LICENSE.md.

Canonical home for both: https://gmaa.ai. Cite by version.

## What is in this release

- README.md (this file)
- README.rtf (this file as rich text, for readers without a Markdown viewer)
- LICENSE.md (the engine license, and the canon's separate CC BY 4.0 grant)
- The engine package (zip): the genericized architecture, with the canon carried in the zip, ready to instantiate per project
- MANIFEST.sha256 and PROVENANCE.tsv (the package's file fingerprints and the source of every file; the same two files are inside the zip)
- SHA256SUMS (the fingerprint of every other file in this list)

The current engine version and its verification fingerprints are published at https://gmaa.ai/versions.html.

## Prerequisites (the substrate floor)

The engine assumes a working substrate. It is a stated prerequisite, not auto-provisioned:

- Claude Code CLI, version 2.1.302 or later (the version this package is built and tested against; the engine's settings keep Claude Code from updating below it but do not stop an older install from starting, so check with `claude --version`)
- git
- a git remote for the spine: a private hosted repository (GitHub or any other host) or a bare repository on the same machine
- tmux
- python3 (the boot check and several probes run on it)
- OpenSSH with `ssh-keygen -Y` signing (every seat signs with its own ed25519 key)
- perl (the boot check uses it; without it, one boot count prints UNREADABLE instead of a number)
- On Windows: WSL2 with a POSIX shell

## Quick start

1. Download the engine zip from the release, and verify it against SHA256SUMS before use.
2. Unzip with a tool that keeps file modes (`unzip` does; the zip records which scripts are executable), then confirm integrity from inside the unzipped package: run `sha256sum -c MANIFEST.sha256` (every line must report OK, or stop and report).
3. Adopt: read `ADOPTION-COVER.md` from the unzipped package and follow it. Adoption runs in four ordered phases (assess, your explicit go, instantiation fills, implementation); `GETTING-STARTED-LINUX-MAC.md` walks them from a blank machine. The launcher comes last, not here: `./launch-orc.sh` boots a seat that already exists, so running it before the project is instantiated halts by design.

The package ships FOUNDATION.md as a skeleton with authoring instructions, and the canon carries an instantiation checklist (section 12) for standing up a new project, including the seeded-fault run (step 8) that proves the controls exist.

## Verify

Every download is cited on two axes together: the engine package version and the canon pin (the specification version the engine ships and conforms to). Verify on both surfaces before use: run `sha256sum -c SHA256SUMS` to confirm the release files (the engine zip, this README in both formats, LICENSE, the manifest and the provenance), then unzip and run `sha256sum -c MANIFEST.sha256` to confirm the package contents, including the canon (pin v1.6.8). Fingerprints for the current release are on https://gmaa.ai/versions.html.

## License summary

- Specification (canon): CC BY 4.0, attribution required.
- Engine (this repository): Apache 2.0 with the Commons Clause, source-available.

Copyright Israel Heskiel. Canonical home: https://gmaa.ai. Cite by version.
