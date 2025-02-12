#! /bin/zsh
#
#Usage: 
#Creating either baseline or comparison file. Then comparing both and identifying differences
#zsh scanFileSystem.sh [-b] [-c]


function scan(){
    find $1 -type f 2>/dev/null | xargs shasum 1>$2 2>/dev/null
}

while getopts 'bc' opt
do
    case $opt in
        b) #create baseline
            echo "Creating baseline..."
            PATHTOSCAN="$HOME"
            OUTPUTPATH="baseline.output"
            scan $PATHTOSCAN $OUTPUTPATH
            echo "Baseline created at ${OUTPUTPATH}"
            ;;
        c) #create comparison
            echo "Creating comparison..."
            PATHTOSCAN="$HOME"
            OUTPUTPATH="comparison.output"
            scan $PATHTOSCAN $OUTPUTPATH
            echo "Comparison created at ${OUTPUTPATH}"
            ;;
        *) #unknown
            echo "Usage $0 [-b] [-c]"
            exit 2
            ;;
    esac
done

#Handling cases where no option is provided
if [ $OPTIND -eq 1 ]
    then echo "No option provided.. Usage $0 [-b] [-c]"
    exit 2
fi