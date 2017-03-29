#!/bin/bash
# 20170302
# Israel Torres
# true ping counter
# tolerance-ping-counter
#
function t_p_c () {
#
counter=0
for x in {1..100}
 do
    ping -c 1 "$domain" \
    | grep -v -i ping \
    | grep "timeout" \
    | grep -v round && counter=$((counter+1)) \
    || counter=0; echo -en "$counter:$x\t";

    if [[ $"counter" -eq "5" ]]
        then
            echo "counter equals 5; $domain \
                has encountered bad result 5 times in a row"
        else
            echo "$domain is OK"
        fi

    sleep 1

 done #for loop
}
#
# --- test case 01 begin ---
# expected input
domain="israeltorres.org"
#
t_p_c "$domain"
# expected output
#0:1	israeltorres.org is OK
#0:2	israeltorres.org is OK
# --- test case 01 end ---
#EOF
