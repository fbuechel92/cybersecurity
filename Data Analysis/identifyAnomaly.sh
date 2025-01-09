#! /bin/zsh
#
#Usage:
#zsh identifyAnomaly.sh < <inputfile>

function mismatch()
{
    for browser in ${browsers[@]}
    do
        [[ "*.$browser*." =~ $1 ]] && return 1
    done
    return 0    
}

while read -r BROWSER
do  
    browsers+=($BROWSER)
done < useragents.txt

awk -F'"' '{print $1, $6}' |
while read -r LINE
do  
    if mismatch $LINE
        then echo "There is an anomaly!! Specifically: $LINE"
    fi
done