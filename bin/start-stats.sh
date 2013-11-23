#!/bin/sh

PREFIX=$1
if [ -z "$PREFIX" ]; then
  echo "$0 <string>"
  exit
fi

iostat -k 5 > $PREFIX.iostat.log &
mpstat -P ALL 5 > $PREFIX.mpstat.log &
vmstat 5 > $PREFIX.vmstat.log &
