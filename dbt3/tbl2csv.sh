#!/bin/sh

find . -name '*.tbl' |awk '{ print "../tbl2csv.pl < " $1 " > " gensub(/tbl/, "csv", $1) }' | sh

