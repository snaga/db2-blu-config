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

./dbt3-pgsql-run-query.sh $DBNAME $PARTITION q2/1.sql
./dbt3-pgsql-run-query.sh $DBNAME $PARTITION q2/2.sql
./dbt3-pgsql-run-query.sh $DBNAME $PARTITION q2/3.sql
./dbt3-pgsql-run-query.sh $DBNAME $PARTITION q2/4.sql
./dbt3-pgsql-run-query.sh $DBNAME $PARTITION q2/5.sql
./dbt3-pgsql-run-query.sh $DBNAME $PARTITION q2/6.sql
./dbt3-pgsql-run-query.sh $DBNAME $PARTITION q2/7.sql
./dbt3-pgsql-run-query.sh $DBNAME $PARTITION q2/8.sql
./dbt3-pgsql-run-query.sh $DBNAME $PARTITION q2/9.sql

./dbt3-pgsql-run-query.sh $DBNAME $PARTITION q2/10.sql
./dbt3-pgsql-run-query.sh $DBNAME $PARTITION q2/11.sql
./dbt3-pgsql-run-query.sh $DBNAME $PARTITION q2/12.sql
./dbt3-pgsql-run-query.sh $DBNAME $PARTITION q2/13.sql
./dbt3-pgsql-run-query.sh $DBNAME $PARTITION q2/14.sql
./dbt3-pgsql-run-query.sh $DBNAME $PARTITION q2/15.sql
./dbt3-pgsql-run-query.sh $DBNAME $PARTITION q2/16.sql
./dbt3-pgsql-run-query.sh $DBNAME $PARTITION q2/17.sql
./dbt3-pgsql-run-query.sh $DBNAME $PARTITION q2/18.sql
./dbt3-pgsql-run-query.sh $DBNAME $PARTITION q2/19.sql

./dbt3-pgsql-run-query.sh $DBNAME $PARTITION q2/20.sql
./dbt3-pgsql-run-query.sh $DBNAME $PARTITION q2/21.sql
./dbt3-pgsql-run-query.sh $DBNAME $PARTITION q2/22.sql
