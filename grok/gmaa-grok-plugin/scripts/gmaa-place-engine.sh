#!/bin/bash
# After operator yes: mkdir ~/Code/<project> and copy the sealed zip from Downloads.
# Does not unzip. Does not git init. Does not mkdir foundation or lanes.
set -eu
PROJECT="${1:-}"
case "$PROJECT" in
  ""|*/*|*[[:space:]]*|*[[:upper:]]*) echo "HALT: project must be a lowercase slug, no spaces, no slashes (got '$PROJECT')" >&2; exit 1 ;;
esac
DEST="${GMAA_GROK_FETCH_DEST:-$HOME/Downloads}"
CODE="${GMAA_CODE_ROOT:-$HOME/Code}"
PARENT="$CODE/$PROJECT"

ZIP=""
if [ -f "$DEST/SHA256SUMS" ]; then
  ZIP_NAME="$(awk '/gmaa-engine-grok_.*\.zip$/ {print $NF; exit}' "$DEST/SHA256SUMS")"
  [ -n "$ZIP_NAME" ] && [ -f "$DEST/$ZIP_NAME" ] && ZIP="$DEST/$ZIP_NAME"
fi
if [ -z "$ZIP" ]; then
  ZIP="$(ls -t "$DEST"/gmaa-engine-grok_*.zip 2>/dev/null | head -1 || true)"
fi
[ -n "$ZIP" ] && [ -f "$ZIP" ] || { echo "HALT: no engine zip in $DEST. Run gmaa-fetch-engine.sh first." >&2; exit 1; }

mkdir -p "$PARENT"
cp "$ZIP" "$PARENT/"
echo "OK copied $(basename "$ZIP") to $PARENT/"
echo "Zip stays zipped. Vanilla instantiate unpacks it. Do not mkdir foundation."
