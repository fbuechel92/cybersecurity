#! /bin/zsh
#
#Usage:
#zsh identifyAnomaly.sh < <inputfile>

function mismatch()
{
    local match i
    match=0

    for browser in browsers
    do
        [[ $browser =~ ".*$LINE.*" ]]
        if [[ $? == 1 ]] 
            then match=1
        fi
    done
    return match
}

while read -r browser
do
    browsers+=($LINE)
done < useragents.txt

awk -F'"' '{print $1, $6}' |
while read LINE
do
    mismatch
done