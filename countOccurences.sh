#!/usr/bin/ zsh
#
#Usage:
#zsh countOccurences.sh < inputfile

declare -A dict

while read line
do
    dict[$line]=$(( $dict[$line]+1 ))
done

for key in ${(@k)dict}
do
    echo "$key: ${dict[$key]}"
done