# gmaa-grok plugin 2.5.7

Grok Build plugin for GMAA. Not the spine. The sealed companion engine zip is fetched separately and left zipped.

Companion engine: `gmaa-engine-grok_v2.5.7.zip`
sha256 `23955abebdbf3950c7d8a422406548758a6d4053e0bae23fce934c78be264291`

## Install

Marketplace (after the catalog PR merges):

```
grok plugin install gmaa-grok --trust
```

Local:

```
grok plugin install ./gmaa-grok-plugin --trust
```

## After install

1. `/gmaa-fetch` writes the sealed engine zip to `~/Downloads` and checks sha256 against `grok/SHA256SUMS` on this repo.
2. `/gmaa-adopt` assesses fit. On an explicit yes, `/gmaa-place <project>` creates `~/Code/<project>/` and copies the zip there. It does not unpack.
3. Vanilla `grok` in that parent instantiates (foundation only). This plugin does not `git init`, does not mkdir `foundation/`, and does not launch seats.

Spoken restart: `/restart`. Then `scripts/orc-restart.sh <lane> --force` from a lane worktree.
