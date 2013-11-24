#!/bin/sh

# Copyright(c) 2013 Uptime Technologies, LLC.

DBNAME=$1
PARTITION=$2

INTERVAL=30

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

../bin/check_db2.sh

cat /dev/null > run_dbt3.log

date | tee -a run_dbt3.log
db2 "CONNECT TO ${DBNAME}${PARTITION}" | tee -a run_dbt3.log
date | tee -a run_dbt3.log

date | tee -a run_dbt3.log
db2 -tvf ../dbt3/dbt3-db2-truncate-tables.sql | tee -a run_dbt3.log
date | tee -a run_dbt3.log

../bin/start-stats.sh LOAD
sleep $INTERVAL

date | tee -a run_dbt3.log
db2 -tvf ../dbt3/dbt3-db2-load-data.sql | tee -a run_dbt3.log
date | tee -a run_dbt3.log

sleep $INTERVAL
../bin/stop-stats.sh

date | tee -a run_dbt3.log
db2 -tvf ../dbt3/dbt3-db2-runstats.sql | tee -a run_dbt3.log
date | tee -a run_dbt3.log

sleep $INTERVAL

db2diag -archive

date | tee -a run_dbt3.log
./dbt3-db2-run-query-all.sh ${DBNAME} ${PARTITION} > ./dbt3-db2-run-query-all.log 2>&1
date | tee -a run_dbt3.log

# clean up
# date | tee -a run_dbt3.log
#db2 -tvf ../dbt3/dbt3-db2-truncate-tables.sql | tee -a run_dbt3.log
# date | tee -a run_dbt3.log
