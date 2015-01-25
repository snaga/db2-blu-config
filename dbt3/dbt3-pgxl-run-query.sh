#!/bin/sh

# Copyright(c) 2013 Uptime Technologies, LLC.

LANG=C
export LANG

DBNAME=$1
PARTITION=$2
QUERY=$3

PSQL_OPTS="-p $PGPORT -U $PGUSER"

#INTERVAL=30
INTERVAL=0

if [ "$PARTITION" = "1" ]; then
    echo -n ""
else
    echo "Usage: $0 <DBNAME> <NUM_OF_PARTITION> <QUERY_FILE>"
    exit
fi;

if [ -z "$QUERY" ]; then
    echo "Usage: $0 <DBNAME> <NUM_OF_PARTITION> <QUERY_FILE>"
    exit
fi;

QUERYID=`basename $QUERY | sed 's/.sql//'`
QUERYFILE=`basename $QUERY`

echo "Explaining $QUERY..."
echo "EXPLAIN" > /tmp/explain.sql
cat $QUERY >> /tmp/explain.sql
psql $PSQL_OPTS -e -f /tmp/explain.sql ${DBNAME}${PARTITION} > Q${QUERYFILE}.explain

../bin/start-stats.sh Q${QUERYID}

# 1st
sleep $INTERVAL;
echo Starting $QUERY...
date >> Q${QUERYFILE}.out
psql $PSQL_OPTS -e -f $QUERY ${DBNAME}${PARTITION} >> Q${QUERYFILE}.out
date >> Q${QUERYFILE}.out

# 2nd
sleep $INTERVAL;
echo Starting $QUERY...
date >> Q${QUERYFILE}.out
psql $PSQL_OPTS -e -f $QUERY ${DBNAME}${PARTITION} >> Q${QUERYFILE}.out
date >> Q${QUERYFILE}.out

# 3rd
sleep $INTERVAL;
echo Starting $QUERY...
date >> Q${QUERYFILE}.out
psql $PSQL_OPTS -e -f $QUERY ${DBNAME}${PARTITION} >> Q${QUERYFILE}.out
date >> Q${QUERYFILE}.out

# 4th
sleep $INTERVAL;
echo Starting $QUERY...
date >> Q${QUERYFILE}.out
psql $PSQL_OPTS -e -f $QUERY ${DBNAME}${PARTITION} >> Q${QUERYFILE}.out
date >> Q${QUERYFILE}.out

# 5th
sleep $INTERVAL;
echo Starting $QUERY...
date >> Q${QUERYFILE}.out
psql $PSQL_OPTS -e -f $QUERY ${DBNAME}${PARTITION} >> Q${QUERYFILE}.out
date >> Q${QUERYFILE}.out

sleep $INTERVAL;

../bin/stop-stats.sh

echo "Subject: $QUERY/${DBNAME}${PARTITION} finished" | /usr/lib/sendmail snaga@uptime.jp

