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
git push
git push origin "v$V"

# Create a GitHub Release if `gh` CLI is available (needs auth/token)
if command -v gh >/dev/null 2>&1; then
  git-cliff --latest --strip header > /tmp/release-notes-$V.md
  gh release create "v$V" --title "v$V" --notes-file /tmp/release-notes-$V.md
fi
