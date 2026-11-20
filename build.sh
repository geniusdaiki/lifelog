#!/bin/bash
# Stamp BUILD into index.html and write version.json, then commit+push main and gh-pages.
set -e
cd "$(dirname "$0")"
B=$(date +%Y%m%d-%H%M)
sed -i "s/const BUILD='[^']*'/const BUILD='$B'/" index.html
echo "{\"build\":\"$B\"}" > version.json
git add -A && git commit -qm "${1:-update} ($B)

Co-Authored-By: Claude Fable 5.1 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_01Lz2E1AFLJH8n9iqXuvNrF3" && git push -q origin main && git push -q origin main:gh-pages && echo "pushed $B"
