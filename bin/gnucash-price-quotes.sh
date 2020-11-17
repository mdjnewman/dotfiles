#!/usr/local/bin/bash

# Not strictly, but my .bash_profile does require it
if ((BASH_VERSINFO[0] < 4)); then echo "Sorry, you need at least bash-4.0 to run this script." >&2; exit 1; fi

. /Users/mnewman/.bash_profile > /dev/null

export PATH=/usr/bin:$PATH

OUT="$(/Applications/Gnucash.app/Contents/MacOS/Gnucash --debug --add-price-quotes='/Users/mnewman/Google Drive (mdjnewman@gmail.com)/Money/GNUCash Files/Money.gnucash' 2>&1)"
EXIT_CODE=$?

if [[ $EXIT_CODE != 0 || "$OUT" == *"ERROR"* ]]; then
    echo Exit code is $EXIT_CODE
    echo "$OUT"
fi

exit $EXIT_CODE
