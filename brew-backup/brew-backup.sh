#!/usr/bin/env bash

set -euf -o pipefail

brew tap > brew-taps.txt
brew list > brew-list.txt
brew cask list > brew-cask-list.txt