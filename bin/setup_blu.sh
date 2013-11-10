#!/bin/sh

# Copyright(c) 2013 Uptime Technologies, LLC.

db2licm -a server_t/db2/license/db2awse_t.lic

db2set DB2_WORKLOAD=ANALYTICS
db2set

db2 -v stop dbm force
db2 -v start dbm
