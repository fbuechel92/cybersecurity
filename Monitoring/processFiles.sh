#! /bin/zsh
#
#Usage:
#Compares two input files and returns discrepancies to file baseCompareRaw.output
#zsh processFiles <baseline> <comparison>

function process(){
    #Sort
    sort -k 2,2 $1 > baseSorted.output
    sort -k 2,2 $2 > compSorted.output
    
    #Identify anomalies
    sdiff baseSorted.output compSorted.output | grep -E '\||<|>'
}

#Compare files and write to new file
process $1 $2 > baseCompareRaw.output