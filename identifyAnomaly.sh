#! /bin/zsh
#
#Usage:
#zsh identifyAnomaly.sh < <inputfile>


while read -r browser
do
    browsers+=($LINE)
done < useragents.txt

awk -F'"' '{print $1, $6}' |
while read LINE
do
    mismatch
done