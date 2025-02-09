#! /bin/zsh
#
#Usage:
#Compares two input files and returns which ports are newly opened/closed
#zsh compareFiles.sh <scanfile1> <scanfile2>

while true 
do

    read LINE1 <&5 || break
    read LINE2 <&6 || break

    #if lines are the same, continue with next iteration
    if [[ $LINE1 == $LINE2 ]] 
        THEN continue
    fi

    #Parse values to variables
    HOST1={$LINE1%% *}
    PORTS1=({$LINE1#* })
    HOST2={$LINE2%% *}
    PORTS2=({$LINE2#* })

done 5< ${1:-scan_2025_02_08} 6< ${2:-scan_2025_02_09}