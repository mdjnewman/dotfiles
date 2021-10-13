#!/usr/local/bin/bash

set -o nounset

export PATH=/usr/local/bin:$PATH

if find "$SEARCH_PATH" -type f -iname "*conflicted*" -maxdepth 1 -exec false {} +
then
    true
else
    echo 'Conflict found'
    osascript -e 'display notification "Conflicting files found, check cron output"'
    exit 1
fi