#!/bin/sh

# Copyright(c) 2013 Uptime Technologies, LLC.

LANG=C
export LANG

DBNAME=$1
PARTITION=$2

INTERVAL=30

if [ "$PARTITION" = "1" ]; then
    echo -n ""
else
    echo "Usage: $0 <DBNAME> <NUM_OF_PARTITION>"
    exit
fi;

../bin/check_pgsql.sh

cat /dev/null > run_dbt3.log

date | tee -a run_dbt3.log
psql -f ../dbt3/dbt3-pgsql-truncate-tables.sql -U postgres ${DBNAME}${PARTITION} | tee -a run_dbt3.log
date | tee -a run_dbt3.log

../bin/start-stats.sh LOAD
sleep $INTERVAL

date | tee -a run_dbt3.log
psql -f ../dbt3/dbt3-pgsql-load-data.sql -U postgres ${DBNAME}${PARTITION} | tee -a run_dbt3.log
psql -f ../dbt3/dbt3-pgsql-create-indexes.sql -U postgres ${DBNAME}${PARTITION} | tee -a prep_dbt3.log
psql -f ../dbt3/dbt3-pgsql-describe-tables.sql -U postgres ${DBNAME}${PARTITION} | tee -a prep_dbt3.log
date | tee -a run_dbt3.log

sleep $INTERVAL
../bin/stop-stats.sh

date | tee -a run_dbt3.log
psql -f ../dbt3/dbt3-pgsql-runstats.sql -U postgres ${DBNAME}${PARTITION} | tee -a run_dbt3.log
date | tee -a run_dbt3.log

sleep $INTERVAL


date | tee -a run_dbt3.log
./dbt3-pgsql-run-query-all.sh ${DBNAME} ${PARTITION} > ./dbt3-pgsql-run-query-all.log 2>&1
date | tee -a run_dbt3.log
