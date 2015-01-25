#!/bin/sh

# Copyright(c) 2013 Uptime Technologies, LLC.

LANG=C
export LANG

DBNAME=$1
PARTITION=$2

PSQL_OPTS="-p $PGPORT -U $PGUSER"

if [ "$PARTITION" = "1" ]; then
    echo -n ""
else
    echo "Usage: $0 <DBNAME> <NUM_OF_PARTITION>"
    exit
fi;

cat /dev/null > prep_dbt3.log

psql $PSQL_OPTS -f ../dbt3/dbt3-pgxl-drop-tables.sql ${DBNAME}${PARTITION} | tee -a prep_dbt3.log
psql $PSQL_OPTS -f ../dbt3/dbt3-pgxl-create-tables.sql ${DBNAME}${PARTITION} | tee -a prep_dbt3.log
#psql $PSQL_OPTS -f ../dbt3/dbt3-pgxl-create-indexes.sql ${DBNAME}${PARTITION} | tee -a prep_dbt3.log
psql $PSQL_OPTS -f ../dbt3/dbt3-pgxl-describe-tables.sql ${DBNAME}${PARTITION} | tee -a prep_dbt3.log
