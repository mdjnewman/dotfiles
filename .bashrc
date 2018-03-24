# Run the following prior to sourcing ~/.bash_profile to get performance info.
# This can be done in a shell started with `env -i /usr/local/bin/bash --noprofile --norc`
# for a clean slate:
#     exec 5> >(ts -i "%.s" >> /tmp/timestamps)
#     export BASH_XTRACEFD="5"
#     set -x
[ -n "$PS1" ] && source ~/.bash_profile;
