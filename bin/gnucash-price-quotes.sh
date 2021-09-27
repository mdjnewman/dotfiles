#!/usr/local/bin/bash

export PATH=/usr/local/bin:$PATH

# Not strictly, but my .bash_profile does require it
if ((BASH_VERSINFO[0] < 4)); then echo "Sorry, you need at least bash-4.0 to run this script." >&2; exit 1; fi

export HOME=/Users/mnewman

. "$HOME/.bash_profile" > /dev/null

OUT="$(/Applications/Gnucash.app/Contents/MacOS/gnucash-cli --debug --quotes get '/Volumes/GoogleDrive-110379146933208071142/My Drive/Money/GNUCash Files/Money.gnucash' 2>&1)"
EXIT_CODE=$?

if [[ $EXIT_CODE != 0 || "$OUT" == *"ERROR"* ]]; then
    echo Exit code is $EXIT_CODE
    echo "$OUT"
fi

exit $EXIT_CODE
