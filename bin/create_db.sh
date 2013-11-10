#!/bin/sh

# Copyright(c) 2013 Uptime Technologies, LLC.

DBNAME=$1
if [ -z "$DBNAME" ]; then
  DBNAME=MYDB
fi

db2 -v "CREATE DB ${DBNAME} ON /var/lib/db2,/disk/disk2/db2,/disk/disk3/db2,/disk/disk4/db2 AUTOCONFIGURE USING MEM_PERCENT 80 APPLY DB AND DBM"  | tee createdb.${DBNAME}.log


