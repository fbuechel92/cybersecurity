#! /bin/zsh
#
#Usage:
#searchByFileType.sh [-c dir] [-i] [-R|r] <pattern> <path>

DEPTH="-maxdepth 1"

#Looping over the arguments and parsing them into variables
while getopts 'c:iRr' opt
do
    case "$opt" in
        c) #copy  files to dir
            COPY=YES
            DESTDIR="$OPTARG"
            mkdir -p "$DESTDIR"
            ;;
        i) #ignore case
            CASEMATCH='-i'
            ;;
        [Rr]) #recursive
            unset DEPTH
            ;;
        *) #unknown
            exit 2
            ;;
    esac
done

# SHIFT helps us remove arguments and change the positional parameter. This way, <pattern> will have positional param 1
shift $((OPTIND - 1))

# Setting default values for non-option arguments
PATTERN=${1:-PDF document}
STARTDIR=${2:-.}

find $STARTDIR $DEPTH -type f | while read FILE
do
    file $FILE | egrep -q $CASEMATCH "$PATTERN" #quiet, no output
    if [[ $? == 0 ]] 
    then 
        echo $FILE
        if [[ $COPY == YES ]] 
        then
            cp -p $FILE $DESTDIR
        fi
    fi
done
