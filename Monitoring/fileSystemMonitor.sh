#! /bin/zsh
#
#Usage:
#The file compares a baseline of the filesystem with the filesystem to identify differences

function scan(){
    find $1 -type f 2>/dev/null | xargs shasum 1>$2 2>/dev/null
}

#Produce baseline
PATHTOSCAN="$HOME"
OUTPUTPATH='baseline.output'
scan $PATHTOSCAN $OUTPUTPATH