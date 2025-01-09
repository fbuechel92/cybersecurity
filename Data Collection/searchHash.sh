#! /bin/zsh
#
#Usage:
#bash searchHash.sh $(shasum -a 1 "FILENAME")

# First, storing the hash provided
HASHINPUT="$1"

# Next, identify all file names, hash them and compare with hashinput
find ./ -type f -maxdepth 1 | while read FILEINPUT
do
    HASHOUTPUT=$(shasum -a 1 "$FILEINPUT") 
    HASHOUTPUT=${HASHOUTPUT%% *}
    if [[ $HASHOUTPUT == $HASHINPUT ]] 
        then echo "A match has been found! The path is $FILEINPUT"
    fi
done