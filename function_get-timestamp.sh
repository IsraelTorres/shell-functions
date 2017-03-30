#!/bin/bash
# Israel Torres
# 20160518
# prints out timestamp in how we want to represent it
function get_timestamp () {
timestamp=$(date +%Y%m%d-%H%M%S)
echo "$timestamp"
}
#
# --- test case 01 begin ---
# expected input
# (nothing)
#
get_timestamp
#
# expected output (typical, not identical)
# 20170329-203919
# --- test case 01 end ---

#EOF