# exec 5> >(ts -i "%.s" >> /tmp/foo)
# export BASH_XTRACEFD="5"
# set -x
[ -n "$PS1" ] && source ~/.bash_profile;
