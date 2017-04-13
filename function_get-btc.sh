#!/bin/bash
# 20170412
# Israel Torres
# ./get-btc.sh
# get bitcoin current USD value
# 1 BTC = x$USD
# using coindesk, JSON BPI
# Powered by CoinDesk,  http://www.coindesk.com/price/
function get_bitcoinUSD () {
JSON=$(curl -s --location http://api.coindesk.com/v1/bpi/currentprice.json)
BTCVAL=$(
    echo "$JSON" \
    | tr ':' '\n' \
    | grep -A 5 '"Bitcoin","bpi"' \
    | tail -n 1 \
    | cut -d '"' -f 2
)
echo "$BTCVAL"
}
# --- test case 01 begin ---
# expected input (none)
#
get_bitcoinUSD
#
# expected output result (format)
# 1,214.5370
# --- test case 01 end ---
#EOF