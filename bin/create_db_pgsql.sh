#!/bin/sh

# Copyright(c) 2013 Uptime Technologies, LLC.

DBNAME=$1
PARTITION=$2

if [ "$PARTITION" = "1" ]; then
  DISK="/disk/disk4/pgsql"
else
    echo "Usage: $0 <DBNAME> <NUM_OF_PARTITION>"
    exit
fi;

psql -c "CREATE TABLESPACE tblspc1 LOCATION '$DISK'" -U postgres postgres | tee -a createdb_pgsql.${DBNAME}${PARTITION}.log

createdb --tablespace=tblspc1 -U postgres ${DBNAME}${PARTITION}
