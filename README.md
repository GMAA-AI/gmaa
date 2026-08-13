# Governed Multi-Agent Architecture (GMAA)

A reference architecture for running multiple AI agent seats and multiple human operators against a single codebase, such that no change lands without authorization at the correct unit, no claim closes without evidence, and no failure degrades silently.

## The correction

Multi-agent systems fail by authorizing at the wrong unit: individual changes get approved while the coherence of the complete pending set goes unexamined. GMAA adds set-level authorization on top of per-change review, never instead of it. Both gates fire: each change is still reviewed on its own, an integrator agent assesses the complete pending set as a unit against the system's logic, evidence, live state, and invariants, and an independent human then ratifies that assessed set before any member commits.

## Two artifacts, two licenses

- The **specification** (the canon) is the free, citeable standard, licensed CC BY 4.0. Read it at https://gmaa.ai/canon.html or as the PDF in this release. Current canon: v1.6.1.
- The **engine** is the runnable implementation in this repository, source-available under the Apache License 2.0 with the Commons Clause: free to use, modify, and redistribute, including commercially, but you may not sell it or offer it as a paid or hosted service. See LICENSE.md.

Canonical home for both: https://gmaa.ai. Cite by version.

## What is in this release

- README.md (this file)
- LICENSE.md (the engine license, and the canon's separate CC BY 4.0 grant)
- The specification PDF (v1.6.1)
- The engine package (zip): the genericized architecture, with the canon carried in-zip under canon/, ready to instantiate per project

The current engine version and its verification fingerprints are published at https://gmaa.ai/versions.html.

## Prerequisites (the substrate floor)

The engine assumes a working substrate. It is a stated prerequisite, not auto-provisioned:

- Claude Code CLI
- git
- a GitHub account
- tmux
- On Windows: WSL2 with a POSIX shell

## Quick start

1. Download the engine zip from the release, and verify it against SHA256SUMS before use.
2. From the unzipped package, confirm integrity: run `sha256sum -c MANIFEST.sha256` (every line must report OK, or stop and report).
3. Make the launcher and scripts executable: `chmod +x launch-orc.sh scripts/*.sh`
4. Launch a seat: `./launch-orc.sh` (the launcher resolves the lane from the folder it runs in; one launcher serves every seat).

The package ships FOUNDATION.md as a skeleton with authoring instructions, and the canon carries an instantiation checklist (section 12) for standing up a new project.

## Verify

Every download is cited on two axes together: the engine package version and the canon pin (the specification version the engine ships and conforms to). Verify on both surfaces before use: run `sha256sum -c SHA256SUMS` to confirm the loose release files (the engine zip, this README, LICENSE, and the specification PDF), then unzip and run `sha256sum -c MANIFEST.sha256` to confirm the package contents, including the canon under `canon/` (pin v1.6.1). Fingerprints for the current release are on https://gmaa.ai/versions.html.

## License summary

- Specification (canon): CC BY 4.0, attribution required.
- Engine (this repository): Apache 2.0 with the Commons Clause, source-available.

Copyright Israel Heskiel. Canonical home: https://gmaa.ai. Cite by version.
