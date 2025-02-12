#! /bin/zsh
#
#Usage:
#Compares two input files and returns discrepancies to the terminal
#zsh compareFiels <baseline> <comparison>

function compare(){
    sdiff $1 $2 | grep -E '\||<|>'
}

compare $1 $2