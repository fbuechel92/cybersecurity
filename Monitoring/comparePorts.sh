#! /bin/zsh
#
#Usage:
#Compares two input files and returns which ports are newly opened/closed
#zsh comparePorts.sh <scanfile1> <scanfile2>

#We need the function because the position of the port could have changed
function notInList(){
    for OTHERPORT in "$@"; do
        if [[ $PORT == $OTHERPORT ]]
            then return 1
        fi
    done
    return 0
}

while true 
do

    read LINE1 <&5 || break
    read LINE2 <&6 || break

    #if lines are the same, continue with next iteration
    if [[ $LINE1 == $LINE2 ]] 
        then continue
    fi

    #Parse values to variables
    HOST1=${LINE1%% *}
    PORTS1=(${=LINE1#* })
    HOST2=${LINE2%% *}
    PORTS2=(${=LINE2#* })

    for PORT1 in ${PORTS1[@]}; do
        PORT=$PORT1
        if notInList ${PORTS2[@]}
            then echo "$PORT1 has been closed"
        fi
    done

    for PORT2 in ${PORTS2[@]}; do
        PORT=$PORT2
        if notInList ${PORTS1[@]} 
            then echo "$PORT2 has been newly opened"
        fi
    done

done 5< ${1:-scan_2025_02_08} 6< ${2:-scan_2025_02_09}