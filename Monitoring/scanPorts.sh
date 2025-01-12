#! /bin/zsh
#
#Usage:
#zsh scanPorts.sh < <input: CIDR> <output file> 

HOSTS=$(nmap -sn $1 | grep -E -o "([1-9]{1,3}\.){3}[1-9]{1,3}")

while read -r HOST; do
    HOSTARRAY+=($HOST)
done <<< $HOSTS

for host in $HOSTARRAY; do
    echo $host
done