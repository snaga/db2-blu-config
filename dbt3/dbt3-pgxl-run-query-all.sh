#!/bin/sh

# Copyright(c) 2013 Uptime Technologies, LLC.

DBNAME=$1
PARTITION=$2

if [ "$PARTITION" = "1" ]; then
    echo -n ""
else
    echo "Usage: $0 <DBNAME> <NUM_OF_PARTITION>"
    exit
fi;

../bin/stop-stats.sh

# db2 "GET DB CFG FOR ${DBNAME}${PARTITION}" | tee db2dbcfg_${DBNAME}${PARTITION}.log

./dbt3-pgxl-run-query.sh $DBNAME $PARTITION pgxl/1.sql
./dbt3-pgxl-run-query.sh $DBNAME $PARTITION pgxl/2.sql
./dbt3-pgxl-run-query.sh $DBNAME $PARTITION pgxl/3.sql
./dbt3-pgxl-run-query.sh $DBNAME $PARTITION pgxl/4.sql
./dbt3-pgxl-run-query.sh $DBNAME $PARTITION pgxl/5.sql
./dbt3-pgxl-run-query.sh $DBNAME $PARTITION pgxl/6.sql
./dbt3-pgxl-run-query.sh $DBNAME $PARTITION pgxl/7.sql
./dbt3-pgxl-run-query.sh $DBNAME $PARTITION pgxl/8.sql
./dbt3-pgxl-run-query.sh $DBNAME $PARTITION pgxl/9.sql

./dbt3-pgxl-run-query.sh $DBNAME $PARTITION pgxl/10.sql
./dbt3-pgxl-run-query.sh $DBNAME $PARTITION pgxl/11.sql
./dbt3-pgxl-run-query.sh $DBNAME $PARTITION pgxl/12.sql
./dbt3-pgxl-run-query.sh $DBNAME $PARTITION pgxl/13.sql
./dbt3-pgxl-run-query.sh $DBNAME $PARTITION pgxl/14.sql
./dbt3-pgxl-run-query.sh $DBNAME $PARTITION pgxl/15.sql
./dbt3-pgxl-run-query.sh $DBNAME $PARTITION pgxl/16.sql
./dbt3-pgxl-run-query.sh $DBNAME $PARTITION pgxl/17.sql
./dbt3-pgxl-run-query.sh $DBNAME $PARTITION pgxl/18.sql
./dbt3-pgxl-run-query.sh $DBNAME $PARTITION pgxl/19.sql

./dbt3-pgxl-run-query.sh $DBNAME $PARTITION pgxl/20.sql
./dbt3-pgxl-run-query.sh $DBNAME $PARTITION pgxl/21.sql
./dbt3-pgxl-run-query.sh $DBNAME $PARTITION pgxl/22.sql
