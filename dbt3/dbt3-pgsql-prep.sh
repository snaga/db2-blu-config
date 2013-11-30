#!/bin/sh

# Copyright(c) 2013 Uptime Technologies, LLC.

LANG=C
export LANG

DBNAME=$1
PARTITION=$2

if [ "$PARTITION" = "1" ]; then
    echo -n ""
else
    echo "Usage: $0 <DBNAME> <NUM_OF_PARTITION>"
    exit
fi;

cat /dev/null > prep_dbt3.log

psql -f ../dbt3/dbt3-pgsql-drop-tables.sql -U postgres ${DBNAME}${PARTITION} | tee -a prep_dbt3.log
psql -f ../dbt3/dbt3-pgsql-create-tables.sql -U postgres ${DBNAME}${PARTITION} | tee -a prep_dbt3.log
#psql -f ../dbt3/dbt3-pgsql-create-indexes.sql -U postgres ${DBNAME}${PARTITION} | tee -a prep_dbt3.log
psql -f ../dbt3/dbt3-pgsql-describe-tables.sql -U postgres ${DBNAME}${PARTITION} | tee -a prep_dbt3.log
