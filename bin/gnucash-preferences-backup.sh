#!/usr/bin/env bash

# Not strictly, but my .bash_profile does require it
if ((BASH_VERSINFO[0] < 4)); then echo "Sorry, you need at least bash-4.0 to run this script." >&2; exit 1; fi

. /Users/mnewman/.bash_profile > /dev/null

cd ~ || exit

OUT="$(tar --create \
    --gzip \
    --file "./Dropbox/Backups/GnuCash Preferences/$(gdate --universal --iso-8601=seconds | sed -e 's/\://g').tar.gz" \
    './Library/Preferences/org.gnucash.Gnucash.plist' \
    './Library/Application Support/Gnucash/' \
    '.aqbanking/' \
    '.gnucash' \
    './Library/Saved Application State/org.gnucash.Gnucash.savedState' \
    2>&1)"

EXIT_CODE=$?

if [[ $EXIT_CODE != 0 || "$OUT" == *"ERROR"* ]]; then
    echo Exit code is $EXIT_CODE
    echo "$OUT"
fi

exit $EXIT_CODE
