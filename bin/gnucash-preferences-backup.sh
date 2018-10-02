#!/usr/bin/env bash

cd ~ || exit

tar --create \
    --gzip \
    --file "./Dropbox/Backups/GnuCash Preferences/$(gdate -Iseconds).tar.gz" \
    './Library/Preferences/org.gnucash.Gnucash.plist' \
    './Library/Application Support/Gnucash/' \
    '.aqbanking/' \
    '.gnucash' \
    './Library/Saved Application State/org.gnucash.Gnucash.savedState'