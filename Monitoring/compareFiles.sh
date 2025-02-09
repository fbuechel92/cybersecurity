#! /bin/zsh
#
#Usage:
#Compares two input files and returns which ports are newly opened/closed
#zsh compareFiles.sh <scanfile1>

while read -r LINE <&6
do
    printf $LINE
done 5<$1 6<$2


