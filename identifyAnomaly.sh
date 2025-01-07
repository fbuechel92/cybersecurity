#! /bin/zsh
#
#Usage:
#zsh identifyAnomaly.sh < <inputfile>

while read -r LINE
do
    agents+=($LINE)
done < ./useragents.txt

echo $agents