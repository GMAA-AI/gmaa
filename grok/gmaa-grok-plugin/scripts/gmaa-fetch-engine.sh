#!/bin/bash
# Pull the sealed Grok engine zip into ~/Downloads. Does not unzip. Does not instantiate.
set -eu
BASE="${GMAA_GROK_RELEASE_BASE:-https://raw.githubusercontent.com/gmaa-ai/gmaa/main/grok}"
DEST="${GMAA_GROK_FETCH_DEST:-$HOME/Downloads}"
SUMS_URL="$BASE/SHA256SUMS"
mkdir -p "$DEST"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo "Fetching SHA256SUMS from $SUMS_URL"
curl -fsSL "$SUMS_URL" -o "$TMP/SHA256SUMS" || { echo "HALT: could not fetch SHA256SUMS" >&2; exit 1; }

ZIP_ROW="$(awk '/gmaa-engine-grok_.*\.zip$/ {print; exit}' "$TMP/SHA256SUMS")"
[ -n "$ZIP_ROW" ] || { echo "HALT: SHA256SUMS has no gmaa-engine-grok_*.zip row" >&2; exit 1; }
ZIP_NAME="$(printf '%s\n' "$ZIP_ROW" | awk '{print $NF}')"
ZIP_SHA="$(printf '%s\n' "$ZIP_ROW" | awk '{print $1}')"
OUT="$DEST/$ZIP_NAME"

if [ -f "$OUT" ]; then
  GOT="$(shasum -a 256 "$OUT" | awk '{print $1}')"
  if [ "$GOT" = "$ZIP_SHA" ]; then
    echo "OK already in $OUT"
    cp "$TMP/SHA256SUMS" "$DEST/SHA256SUMS"
    exit 0
  fi
  echo "existing $OUT has wrong sha; re-fetching"
fi

echo "Downloading $ZIP_NAME to $DEST"
curl -fsSL "$BASE/$ZIP_NAME" -o "$OUT" || { echo "HALT: could not fetch $ZIP_NAME" >&2; exit 1; }
GOT="$(shasum -a 256 "$OUT" | awk '{print $1}')"
if [ "$GOT" != "$ZIP_SHA" ]; then
  echo "HALT: sha256 mismatch for $OUT" >&2
  echo "  expected $ZIP_SHA" >&2
  echo "  got      $GOT" >&2
  rm -f "$OUT"
  exit 1
fi
cp "$TMP/SHA256SUMS" "$DEST/SHA256SUMS"
echo "OK $OUT"
echo "Left as a zip in Downloads. On adopt, copy into ~/Code/<project>/. Do not unpack."
