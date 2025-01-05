#! /bin/zish
#
#Goal:
#read the access log file, count occurence by page for given parameter ip
#
#Usage:
#zsh countPages.sh <IP Address> < access.log

declare -A dict

while read addr d1 d2 datim gmtoff getr page therest
do
    if [[ $addr == $1 ]]
        then dict[$page]=$(( $dict[$page]+1 ))
    fi
done

for key in ${(@k)dict}
do
    echo "$dict[$key]: $key"
done