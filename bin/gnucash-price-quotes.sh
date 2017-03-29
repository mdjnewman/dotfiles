#!/usr/bin/env bash

. /Users/mnewman/.bash_profile > /dev/null

OUT="$(/Applications/Gnucash.app/Contents/MacOS/Gnucash --debug --add-price-quotes='/Users/mnewman/Dropbox/Documents/Money/GNUCash Files/Money.gnucash' 2>&1)"
EXIT_CODE=$?

if [[ $EXIT_CODE != 0 || "$OUT" == *"ERROR"* ]]; then
    echo Exit code is $EXIT_CODE
    echo "$OUT"
fi

exit $EXIT_CODE
