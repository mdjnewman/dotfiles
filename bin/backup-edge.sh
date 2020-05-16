#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

cd ~ || exit

OUT="$(tar --create \
    --gzip \
    --file "./Dropbox/Backups/Edge/$(gdate --universal --iso-8601=seconds | sed -e 's/\://g').tar.gz" \
    '/Volumes/GARMIN/Garmin/Locations' \
    '/Volumes/GARMIN/Garmin/Metrics' \
    '/Volumes/GARMIN/Garmin/Records' \
    '/Volumes/GARMIN/Garmin/Settings' \
    '/Volumes/GARMIN/Garmin/Sports' \
    '/Volumes/GARMIN/Garmin/Totals' \
    '/Volumes/GARMIN/Garmin/Weight' \
    '/Volumes/GARMIN/Garmin/Workouts'
    2>&1)"

EXIT_CODE=$?

if [[ $EXIT_CODE != 0 || "$OUT" == *"ERROR"* ]]; then
    echo Exit code is $EXIT_CODE
    echo "$OUT"
fi

exit $EXIT_CODE
