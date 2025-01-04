#!/usr/bin/ zsh
#
#Usage:
#zsh sumBytes.sh < inputfileIpBytes.txt

declare -A dict

while read IP BYTE
do
    dict[$IP]=$(( $dict[$IP]+$BYTE ))
done

for IP in ${(@k)dict}
do
    echo "$IP $dict[$IP]"
done