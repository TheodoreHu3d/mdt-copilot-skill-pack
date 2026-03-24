#!/usr/bin/env bash
set -euo pipefail
TARGET="${1:-$HOME/.openclaw/skills}"
mkdir -p "$TARGET"
cp -r skills/* "$TARGET/"
echo "Installed skills to $TARGET"
