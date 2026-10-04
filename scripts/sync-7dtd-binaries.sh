#!/usr/bin/env bash
# Copy the game assemblies this project compiles against from YOUR OWN 7 Days to Die
# dedicated server into src/7dtd-binaries/.
# These files belong to The Fun Pimps, so they are not stored in this repository.
#
# Usage: bash scripts/sync-7dtd-binaries.sh "/path/to/7 Days to Die Dedicated Server"
set -euo pipefail

SERVER="${1:-}"
[ -d "$SERVER" ] || { echo "Usage: $0 <7 Days to Die dedicated server folder>" >&2; exit 2; }

MANAGED=""
for d in 7DaysToDieServer_Data 7DaysToDie_Data; do
  [ -d "$SERVER/$d/Managed" ] && { MANAGED="$SERVER/$d/Managed"; break; }
done
[ -n "$MANAGED" ] || { echo "Managed folder not found under: $SERVER" >&2; exit 2; }

DEST="$(cd "$(dirname "$0")/.." && pwd)/src/7dtd-binaries"
mkdir -p "$DEST"

for f in Assembly-CSharp Assembly-CSharp-firstpass LogLibrary UnityEngine.CoreModule \
         UnityEngine.AnimationModule 0Harmony Noemax.GZip; do
  [ -f "$MANAGED/$f.dll" ] || { echo "Missing: $MANAGED/$f.dll" >&2; exit 1; }
  cp -f "$MANAGED/$f.dll" "$DEST/$f.dll"
  echo "copied $f.dll"
done
echo "Done. Build with: dotnet build src/SdtdServerKit.csproj -c Release"
