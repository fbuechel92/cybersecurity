#!/bin/zsh
#
#Usage:
#getLocalInfo.sh < cmds.txt

function retrieveCommand(){
    
    #First, for every line of cmds.txt we need to obtain the commands
    UNIXCMD=${LINE%%|*}
    REMAINDER=${LINE#*|}
    WINCMD=${REMAINDER%%|*}
    REMAINDER=${REMAINDER#*|}
    XMLTAG=${REMAINDER%%|*}

    #Next, we define CMD
    if [[ $OSTYPE == "MSWIN" ]]
    then CMD="$WINCMD"
    else CMD="$UNIXCMD"
    fi
}

function getInfo(){

    #First, we read the data from cmds.txt into an array variable
    while read -r LINE #r is to prevent backslash from being interpreted as escape char
    do
        ARRAY+=("$LINE")
    done

    #Next, we need to access each line and call the relevant CMD/TAG to write them to the output file
    for LINE in "${ARRAY[@]}"
    do
        if [[ "${LINE:0:1}" == '#' ]]
        then continue
        else 
            retrieveCommand
            printf '%s\n' $XMLTAG
            $CMD
        fi
    done
}

OSTYPE=$(./osDetect.sh)
getInfo 1> localInfoDump.txt 2> localInfoError.txt
