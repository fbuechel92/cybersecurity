#!/usr/bin/ zsh
#
#Usage:
#zsh sumBytes.sh < inputfileIpBytes.txt

declare -A dict

while read IP
do
    dict[$IP]=$(( $dict[$IP]+1 ))
done

for IP in ${(@k)dict}
do
    echo "$IP $dict[$IP]"
done