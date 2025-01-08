#! /bin/zsh
#
#Usage:
#zsh identifyAnomaly.sh < <inputfile>

function mismatch()
{
    local match i
    match=0

    for browser in ${browsers[@]}
    do
        [[ "*.$browser*." =~ $1 ]]
        if [[ $? == 1 ]] 
            then match=1
        fi
        match=1
    done
    return $match
}

while read -r BROWSER
do  
    browsers+=($BROWSER)
done < useragents.txt

awk -F'"' '{print $1, $6}' |
while read -r LINE
do  
    mismatch $LINE
    if [[ $? == 1 ]]
    then
        echo "There is an anomaly!! Specifically: $LINE"
    fi
done