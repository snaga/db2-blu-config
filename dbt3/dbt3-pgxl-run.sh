#!/bin/sh

# Copyright(c) 2013 Uptime Technologies, LLC.

LANG=C
export LANG

DBNAME=$1
PARTITION=$2

PSQL_OPTS="-p $PGPORT -U $PGUSER"

INTERVAL=30

if [ "$PARTITION" = "1" ]; then
    echo -n ""
else
    echo "Usage: $0 <DBNAME> <NUM_OF_PARTITION>"
    exit
fi;

../bin/check_pgxl.sh

cat /dev/null > run_dbt3.log

date | tee -a run_dbt3.log
psql $PSQL_OPTS -f ../dbt3/dbt3-pgxl-truncate-tables.sql ${DBNAME}${PARTITION} | tee -a run_dbt3.log
date | tee -a run_dbt3.log

../bin/start-stats.sh LOAD
sleep $INTERVAL

date | tee -a run_dbt3.log
psql $PSQL_OPTS -f ../dbt3/dbt3-pgxl-load-data.sql ${DBNAME}${PARTITION} | tee -a run_dbt3.log
psql $PSQL_OPTS -f ../dbt3/dbt3-pgxl-create-indexes.sql ${DBNAME}${PARTITION} | tee -a prep_dbt3.log
psql $PSQL_OPTS -f ../dbt3/dbt3-pgxl-describe-tables.sql ${DBNAME}${PARTITION} | tee -a prep_dbt3.log
date | tee -a run_dbt3.log

sleep $INTERVAL
../bin/stop-stats.sh

date | tee -a run_dbt3.log
psql $PSQL_OPTS -f ../dbt3/dbt3-pgxl-runstats.sql ${DBNAME}${PARTITION} | tee -a run_dbt3.log
date | tee -a run_dbt3.log

sleep $INTERVAL


date | tee -a run_dbt3.log
./dbt3-pgxl-run-query-all.sh ${DBNAME} ${PARTITION} > ./dbt3-pgxl-run-query-all.log 2>&1
date | tee -a run_dbt3.log
