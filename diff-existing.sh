#!/usr/bin/env bash

set -o errexit
# set -o nounset
set -o pipefail

IFS="
"

declare -A SUBMODULES
while read -r line; do SUBMODULES[$line]=1; done < <(grep path .gitmodules | cut -d ' ' -f 3)

for i in $(git ls-files)
do
  [ -n "${SUBMODULES[$i]}" ] && continue

  [ ! -f "$HOME/$i" ] && continue

  if ! diff="$(/usr/bin/env diff "$i" "$HOME/$i")"; then
    echo -e "\n=== $i ==="
    echo "$diff"
  fi
done
