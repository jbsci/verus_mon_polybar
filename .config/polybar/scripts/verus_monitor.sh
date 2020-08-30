#!/bin/bash

#Simple script to monitor verus mining in polybar. Requires jq and bc


#path to verus executeable. 
vrscexec=~/veruscoin/verus

if ! test -f "$vrscexec"; then
    echo "ERROR: Incorrect path to verus executeable"
    exit 1
fi

if ! command -v jq &>/dev/null ; then
    echo "jq not found."
    exit 1
fi

if ! command -v bc &>/dev/null; then 
    echo "bc not found."
    exit 1
fi

#get raw hashrate
rawhashrate=$("$vrscexec" getmininginfo | jq '.localhashps')
#Convert to MH/s
MHps=$(echo "scale=4; $rawhashrate" / 1024 / 1024 | bc) 
#Outputs number of threads being used
nthreads=$("$vrscexec" getmininginfo | jq '.genproclimit')
#Shows current balance
balance=$("$vrscexec" getwalletinfo | jq '.balance')

#Format for master output
echo $MHps 'MH/s ('$nthreads'T) | Bal: '$balance
