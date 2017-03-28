#!/bin/bash
# Israel Torres
# 20170328
# swaps upper and lower characters in a string
# tip: method to make base64 strings obfuscated
# tip: use with rot5n for more hell
#
function swap_caps () {
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
#
for x in $(echo "$string" | fold -1)
    do
        if [[ "$x" =~ [A-Z] ]]
            then
                echo -en "$x" | tr '[:upper:]' '[:lower:]'
        else
                echo -en "$x" | tr '[:lower:]' '[:upper:]'
        fi

    done
#
IFS=$SAVEIFS
}
#
# --- test case 01 begin ---
# expected input
# Hello World!
# string='Hello World!'
#
# swap_caps "$swap_caps"
# expected output
# hELLO wORLD!
# --- test case 01 end ---

#EOF