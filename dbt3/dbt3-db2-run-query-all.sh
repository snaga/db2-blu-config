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

../bin/stop-stats.sh

db2 "CONNECT TO ${DBNAME}${PARTITION}"
db2 "GET DB CFG FOR ${DBNAME}${PARTITION}" | tee db2dbcfg_${DBNAME}${PARTITION}.log

./dbt3-db2-run-query.sh $DBNAME $PARTITION q/1.sql
./dbt3-db2-run-query.sh $DBNAME $PARTITION q/2.sql
./dbt3-db2-run-query.sh $DBNAME $PARTITION q/3.sql
./dbt3-db2-run-query.sh $DBNAME $PARTITION q/4.sql
./dbt3-db2-run-query.sh $DBNAME $PARTITION q/5.sql
./dbt3-db2-run-query.sh $DBNAME $PARTITION q/6.sql
./dbt3-db2-run-query.sh $DBNAME $PARTITION q/7.sql
./dbt3-db2-run-query.sh $DBNAME $PARTITION q/8.sql
./dbt3-db2-run-query.sh $DBNAME $PARTITION q/9.sql

./dbt3-db2-run-query.sh $DBNAME $PARTITION q/10.sql
./dbt3-db2-run-query.sh $DBNAME $PARTITION q/11.sql
./dbt3-db2-run-query.sh $DBNAME $PARTITION q/12.sql
./dbt3-db2-run-query.sh $DBNAME $PARTITION q/13.sql
./dbt3-db2-run-query.sh $DBNAME $PARTITION q/14.sql
./dbt3-db2-run-query.sh $DBNAME $PARTITION q/15.sql
./dbt3-db2-run-query.sh $DBNAME $PARTITION q/16.sql
./dbt3-db2-run-query.sh $DBNAME $PARTITION q/17.sql
./dbt3-db2-run-query.sh $DBNAME $PARTITION q/18.sql
./dbt3-db2-run-query.sh $DBNAME $PARTITION q/19.sql

./dbt3-db2-run-query.sh $DBNAME $PARTITION q/20.sql
./dbt3-db2-run-query.sh $DBNAME $PARTITION q/21.sql
./dbt3-db2-run-query.sh $DBNAME $PARTITION q/22.sql
