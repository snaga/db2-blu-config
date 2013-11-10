#!/bin/sh

# Copyright(c) 2013 Uptime Technologies, LLC.

cat /dev/null > dd.log

echo /home/dd.out >> dd.log
dd if=/dev/zero of=/home/dd.out bs=8192 count=100000 >> dd.log 2>&1
dd if=/dev/zero of=/home/dd.out bs=8192 count=100000 >> dd.log 2>&1
dd if=/dev/zero of=/home/dd.out bs=8192 count=100000 >> dd.log 2>&1

echo /var/tmp/dd.out >> dd.log
dd if=/dev/zero of=/var/tmp/dd.out bs=8192 count=100000 >> dd.log 2>&1
dd if=/dev/zero of=/var/tmp/dd.out bs=8192 count=100000 >> dd.log 2>&1
dd if=/dev/zero of=/var/tmp/dd.out bs=8192 count=100000 >> dd.log 2>&1

echo /disk/disk2/dd.out >> dd.log
dd if=/dev/zero of=/disk/disk2/dd.out bs=8192 count=100000 >> dd.log 2>&1
dd if=/dev/zero of=/disk/disk2/dd.out bs=8192 count=100000 >> dd.log 2>&1
dd if=/dev/zero of=/disk/disk2/dd.out bs=8192 count=100000 >> dd.log 2>&1

echo /disk/disk3/dd.out >> dd.log
dd if=/dev/zero of=/disk/disk3/dd.out bs=8192 count=100000 >> dd.log 2>&1
dd if=/dev/zero of=/disk/disk3/dd.out bs=8192 count=100000 >> dd.log 2>&1
dd if=/dev/zero of=/disk/disk3/dd.out bs=8192 count=100000 >> dd.log 2>&1

echo /disk/disk4/dd.out >> dd.log
dd if=/dev/zero of=/disk/disk4/dd.out bs=8192 count=100000 >> dd.log 2>&1
dd if=/dev/zero of=/disk/disk4/dd.out bs=8192 count=100000 >> dd.log 2>&1
dd if=/dev/zero of=/disk/disk4/dd.out bs=8192 count=100000 >> dd.log 2>&1

rm -f /home/dd.out /var/tmp/dd.out /disk/disk2/dd.out /disk/disk3/dd.out /disk/disk4/dd.out

