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

cat /dev/null > prep_dbt3.log

db2 "connect to ${DBNAME}${PARTITION}" | tee -a prep_dbt3.log
db2 -tvf ../dbt3/dbt3-db2-drop-tables.sql | tee -a prep_dbt3.log
db2 -tvf ../dbt3/dbt3-db2-create-tables-row.sql | tee -a prep_dbt3.log
db2 -tvf ../dbt3/dbt3-db2-create-indexes.sql | tee -a prep_dbt3.log
db2 -tvf ../dbt3/dbt3-db2-describe-tables.sql | tee -a prep_dbt3.log
