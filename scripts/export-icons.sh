#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")/.."
root="$PWD"
developer_dir="$(xcode-select -p)"
ictool="$developer_dir/../Applications/Icon Composer.app/Contents/Executables/ictool"
if [[ ! -x "$ictool" ]]; then
  echo "Icon Composer's ictool is required. Select an Xcode installation containing Icon Composer." >&2
  exit 1
fi

temp_dir="$(mktemp -d)"
trap 'rm -rf "$temp_dir"' EXIT
mkdir -p icons assets

for app in P4V P4Merge P4Admin; do
  case "$app" in
    P4V) source=P4_p4v.icon ;;
    P4Merge) source=P4_p4merge.icon ;;
    P4Admin) source=P4_p4admin.icon ;;
  esac
  raw_icon="$temp_dir/$app.png"
  "$ictool" "$root/$source" --export-image \
    --output-file "$raw_icon" --platform macOS \
    --rendition Default --width 1024 --height 1024 --scale 1 \
    --design-generation 27
  swift scripts/pad-icon.swift "$raw_icon" "icons/$app.png"

  iconset="$temp_dir/$app.iconset"
  mkdir -p "$iconset"
  for size in 16 32 128 256 512; do
    sips -z "$size" "$size" "icons/$app.png" --out "$iconset/icon_${size}x${size}.png" >/dev/null
    retina=$((size * 2))
    sips -z "$retina" "$retina" "icons/$app.png" --out "$iconset/icon_${size}x${size}@2x.png" >/dev/null
  done
  iconutil -c icns "$iconset" -o "icons/$app.icns"
done

swift scripts/make-preview.swift
