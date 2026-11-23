#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

message="${*:-Update files}"

git add -A

if git diff --cached --quiet; then
    echo 'No changes to commit.'
else
    git commit -m "$message"
fi

git push -u origin "$(git branch --show-current)"