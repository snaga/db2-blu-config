#!/bin/sh

# Copyright(c) 2013 Uptime Technologies, LLC.

db2level > db2level.log

db2licm -l > db2licm.log

db2set > db2set.log

db2 "GET DBM CFG" > db2dbmcfg.log

