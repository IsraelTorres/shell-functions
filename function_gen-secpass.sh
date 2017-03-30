#!/bin/bash
# Israel Torres
# 20140822
# password generator

function GenSecPass16 () {
UUID=$(/usr/bin/uuidgen)
LEN0=$(echo -en $UUID | wc -c)
LEN1=$((LEN0/2))
UUIDUP=${UUID:0:LEN1}
UUID01=$(echo $UUIDUP | tr '[:lower:]' '[:upper:]')
UUIDLC=${UUID:LEN1:LEN1}
UUID02=$(echo $UUIDLC | tr '[:upper:]' '[:lower:]')
UUID00=$UUID01$UUID02
UUID16=${UUID00:8:16} # gets middle goodness
echo $UUID16
}

function GenSecPass16left () {
UUID=$(/usr/bin/uuidgen)
LEN0=$(echo -en $UUID | wc -c)
LEN1=$((LEN0/2))
UUIDUP=${UUID:0:LEN1}
UUID01=$(echo $UUIDUP | tr '[:lower:]' '[:upper:]')
UUIDLC=${UUID:LEN1:LEN1}
UUID02=$(echo $UUIDLC | tr '[:upper:]' '[:lower:]')
UUID00=$UUID01$UUID02
UUID16=${UUID00:9:16} # gets middle goodness
echo $UUID16
}

function GenSecPass36 () {
UUID=$(/usr/bin/uuidgen)
LEN0=$(echo -en $UUID | wc -c)
LEN1=$((LEN0/2))
UUIDUP=${UUID:0:LEN1}
UUID01=$(echo $UUIDUP | tr '[:lower:]' '[:upper:]')
UUIDLC=${UUID:LEN1:LEN1}
UUID02=$(echo $UUIDLC | tr '[:upper:]' '[:lower:]')
UUID00=$UUID01$UUID02
echo $UUID00
}
#
# --- test case 01 begin ---
# expected input
# (nothing)
#
GenSecPass16
GenSecPass16left
GenSecPass36
#
# expected output (typical, not identical)
# -36DE-4C47-bc60-
# 5186-4A34-ae71-e
# 4506B7E0-F844-4F09-8b83-747ba8d365f5
# --- test case 01 end ---

#EOF