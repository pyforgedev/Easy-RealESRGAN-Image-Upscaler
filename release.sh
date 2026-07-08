#!/usr/bin/env bash
# Fallback for environments without `make`. Mirrors the Makefile targets.
# Usage: ./release.sh <version>   e.g. ./release.sh 0.1.1
set -euo pipefail

V="${1:?Usage: release.sh <version> (e.g. 0.1.1)}"

# Ensure git-cliff is on PATH (e.g. ~/.local/bin)
export PATH="$HOME/.local/bin:$PATH"

git-cliff --tag "$V" -o CHANGELOG.md
git add CHANGELOG.md
git commit -m "chore: release v$V"
git tag "v$V"
git push --follow-tags
