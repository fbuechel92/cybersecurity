#! /bin/zsh
#
#Usage:
#searchHash.sh < HASH (sha1sum)

# First, storing the hash provided
HASHINPUT="$1"

# Next, identify all file names, hash them and compare with hashinput
find ./ -type f -maxdepth 1 | while read FILEINPUT
do
    HASHOUTPUT=$(shasum -a 1 "$FILEINPUT" | cut -d ' ' -f 1)
    if [[ $HASHOUTPUT == $HASHINPUT ]] 
        then echo 'A match has been found!'
    fi
done