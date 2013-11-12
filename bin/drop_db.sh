#!/bin/sh

# Copyright(c) 2013 Uptime Technologies, LLC.

DBNAME=$1
PARTITION=$2

if [ "$PARTITION" = "1" ]; then
    echo -n ""
elif [ "$PARTITION" = "2" ]; then
    echo -n ""
elif [ "$PARTITION" = "4" ]; then
    echo -n ""
else
    echo "Usage: $0 <DBNAME> <NUM_OF_PARTITION>"
    exit
fi;

db2 -v "CONNECT RESET"
db2 -v "DROP DB ${DBNAME}${PARTITION}";
