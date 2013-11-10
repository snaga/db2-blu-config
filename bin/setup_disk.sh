#!/bin/sh

# Copyright(c) 2013 Uptime Technologies, LLC.

mkdir -p /var/lib/db2
mkdir -p /disk/disk2/db2
mkdir -p /disk/disk3/db2
mkdir -p /disk/disk4/db2

chown db2inst1:db2iadm1 /var/lib/db2 /disk/disk2/db2 /disk/disk3/db2 /disk/disk4/db2

ls -la /var/lib/db2 /disk/disk2/db2 /disk/disk3/db2 /disk/disk4/db2
