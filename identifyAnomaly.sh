#! /bin/zsh
#
#Usage:
#zsh identifyAnomaly.sh < <inputfile>


while read -r LINE
do
    agents+=($LINE)
done < useragents.txt

awk -F'"' '{print $1, $6}' |
while read LINE
do
    echo $LINE
done