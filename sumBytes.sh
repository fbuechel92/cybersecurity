#!/usr/bin/ zsh
#
#Usage:
#zsh sumBytes.sh < inputfileIpBytes.txt

declare -A dict

while read IP
do
    dict[$IP]=$(( $dict[$IP]+1 ))
    echo "$dict[$IP]"
done
