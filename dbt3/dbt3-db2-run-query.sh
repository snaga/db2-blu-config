#!/bin/sh

# Copyright(c) 2013 Uptime Technologies, LLC.

DBNAME=$1
PARTITION=$2
QUERY=$3

INTERVAL=30

if [ "$PARTITION" = "1" ]; then
    echo -n ""
elif [ "$PARTITION" = "2" ]; then
    echo -n ""
elif [ "$PARTITION" = "4" ]; then
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

db2 "connect to ${DBNAME}${PARTITION}"
db2 "set current explain mode explain"
db2 -tf $QUERY
db2 "set current explain mode no"
db2exfmt -d ${DBNAME}${PARTITION} -e db2admin -n -1 -s -1 -w -1 -# no_map_char -o Q${QUERYFILE}.explain

../bin/start-stats.sh Q${QUERYID}

# 1st
sleep $INTERVAL;
echo Starting $QUERY...
date >> Q${QUERYFILE}.out
db2 -tvf $QUERY >> Q${QUERYFILE}.out
date >> Q${QUERYFILE}.out

# 2nd
sleep $INTERVAL;
echo Starting $QUERY...
date >> Q${QUERYFILE}.out
db2 -tvf $QUERY >> Q${QUERYFILE}.out
date >> Q${QUERYFILE}.out

# 3rd
sleep $INTERVAL;
echo Starting $QUERY...
date >> Q${QUERYFILE}.out
db2 -tvf $QUERY >> Q${QUERYFILE}.out
date >> Q${QUERYFILE}.out

# 4th
sleep $INTERVAL;
echo Starting $QUERY...
date >> Q${QUERYFILE}.out
db2 -tvf $QUERY >> Q${QUERYFILE}.out
date >> Q${QUERYFILE}.out

# 5th
sleep $INTERVAL;
echo Starting $QUERY...
date >> Q${QUERYFILE}.out
db2 -tvf $QUERY >> Q${QUERYFILE}.out
date >> Q${QUERYFILE}.out

sleep $INTERVAL;

../bin/stop-stats.sh

echo "Subject: $QUERY/${DBNAME}${PARTITION} finished" | /usr/lib/sendmail snaga@uptime.jp

