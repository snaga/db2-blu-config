#!/bin/sh

# Copyright(c) 2013 Uptime Technologies, LLC.

cat /proc/cpuinfo > cpuinfo.log
free > free.log
df -a > df.log
uname -a > uname.log
dmesg > dmesg.log
cat /etc/issue > issue.log

