#!/bin/bash
# 20170302
# Israel Torres
# true ping counter
# tolerance-ping-counter
# # updated 20170329 to account for total packet loss, due to ICMP admin block
function t_p_c () {
#
counter=0
tolerance=5
for x in {1..100}
 do
 	ping -c 1 "$domain" \
 	| grep -v -i ping \
 	| grep -E 'timeout|100.0% packet loss' \
 	| grep -v 'round' && counter=$((counter+1)) \
 	|| counter=0 
 	
 	echo -en "$counter:$x\t"
 	
    if [[ "$counter" -eq "$tolerance" ]]
        then
            echo "counter equals $tolerance; $domain has had bad result $tolerance times in a row"
        else
        	if [[ "$counter" -gt "0" ]]
        		then
        			echo "$domain is having issues..."
        		else
        			echo "$domain is OK"
        	fi
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
