#!/bin/sh

# Copyright(c) 2013 Uptime Technologies, LLC.

DBNAME=$1
PARTITION=$2

if [ "$PARTITION" = "1" ]; then
  DISK="/disk/disk4/db2"
elif [ "$PARTITION" = "2" ]; then
  DISK="/disk/disk3/db2,/disk/disk4/db2"
elif [ "$PARTITION" = "4" ]; then
  DISK="/var/lib/db2,/disk/disk2/db2,/disk/disk3/db2,/disk/disk4/db2"
else
    echo "Usage: $0 <DBNAME> <NUM_OF_PARTITION>"
    exit
fi;

db2 -v "CREATE DB ${DBNAME}${PARTITION} ON ${DISK} AUTOCONFIGURE USING MEM_PERCENT 80 APPLY DB AND DBM" | tee -a createdb.${DBNAME}${PARTITION}.log

# to apply recommended shared memory size. (SQL1084C)
db2 "CONNECT TO ${DBNAME}${PARTITION}" | tee -a createdb.${DBNAME}${PARTITION}.log
db2 -tvf /opt/ibm/db2/V10.5/misc/EXPLAIN.DDL | tee -a createdb.${DBNAME}${PARTITION}.log

# db2 "AUTOCONFIGURE APPLY NONE" | tee -a createdb.${DBNAME}.log

db2 update db cfg for ${DBNAME}${PARTITION} using LOGPRIMARY 128 | tee -a createdb.${DBNAME}${PARTITION}.log
db2 update db cfg for ${DBNAME}${PARTITION} using LOGSECOND 128 | tee -a createdb.${DBNAME}${PARTITION}.log

db2stop
db2start

