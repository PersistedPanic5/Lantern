#!/usr/bin/env bash
# Publishes Lantern to GitHub Pages. Run in this folder: ./deploy.sh
# Copies a new lantern.html from Downloads (if there is one) over index.html, then commits and pushes.
set -e
cd "$(dirname "$0")"
SRC="${1:-$HOME/Downloads/lantern.html}"
MSG="${2:-Update Lantern}"
[ -f "$SRC" ] && cp "$SRC" ./index.html && echo "Copied $SRC"
git add .
if git diff --cached --quiet; then echo "Nothing changed."; exit 0; fi
git commit -m "$MSG"
git push
echo "Pushed. Live in about a minute: $(gh api 'repos/{owner}/lantern/pages' --jq .html_url)"
