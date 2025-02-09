#! /bin/zsh
#
#Usage:
#Compares two input files and returns which ports are newly opened/closed
#zsh compareFiles.sh <scanfile1>

while true 
do

    read LINE1 <&5 || break
    read LINE2 <&6 || break

done 5< ${1:-scan_2025_02_08} 6< ${2:-scan_2025_02_09}