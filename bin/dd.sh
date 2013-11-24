#!/bin/sh

# Copyright(c) 2013 Uptime Technologies, LLC.

cat /dev/null > dd.log

echo Writing /home/dd.out >> dd.log
dd if=/dev/zero of=/home/dd.out bs=8192 count=100000 >> dd.log 2>&1
dd if=/dev/zero of=/home/dd.out bs=8192 count=100000 >> dd.log 2>&1
dd if=/dev/zero of=/home/dd.out bs=8192 count=100000 >> dd.log 2>&1

echo Reading /home/dd.out >> dd.log
dd if=/home/dd.out of=/dev/null bs=8192 count=100000 >> dd.log 2>&1
dd if=/home/dd.out of=/dev/null bs=8192 count=100000 >> dd.log 2>&1
dd if=/home/dd.out of=/dev/null bs=8192 count=100000 >> dd.log 2>&1

echo Writing /var/tmp/dd.out >> dd.log
dd if=/dev/zero of=/var/tmp/dd.out bs=8192 count=100000 >> dd.log 2>&1
dd if=/dev/zero of=/var/tmp/dd.out bs=8192 count=100000 >> dd.log 2>&1
dd if=/dev/zero of=/var/tmp/dd.out bs=8192 count=100000 >> dd.log 2>&1

echo Reading /var/tmp/dd.out >> dd.log
dd if=/var/tmp/dd.out of=/dev/null bs=8192 count=100000 >> dd.log 2>&1
dd if=/var/tmp/dd.out of=/dev/null bs=8192 count=100000 >> dd.log 2>&1
dd if=/var/tmp/dd.out of=/dev/null bs=8192 count=100000 >> dd.log 2>&1

echo Writing /disk/disk2/dd.out >> dd.log
dd if=/dev/zero of=/disk/disk2/dd.out bs=8192 count=100000 >> dd.log 2>&1
dd if=/dev/zero of=/disk/disk2/dd.out bs=8192 count=100000 >> dd.log 2>&1
dd if=/dev/zero of=/disk/disk2/dd.out bs=8192 count=100000 >> dd.log 2>&1

echo Reading /disk/disk2/dd.out >> dd.log
dd if=/disk/disk2/dd.out of=/dev/null bs=8192 count=100000 >> dd.log 2>&1
dd if=/disk/disk2/dd.out of=/dev/null bs=8192 count=100000 >> dd.log 2>&1
dd if=/disk/disk2/dd.out of=/dev/null bs=8192 count=100000 >> dd.log 2>&1

echo Writing /disk/disk3/dd.out >> dd.log
dd if=/dev/zero of=/disk/disk3/dd.out bs=8192 count=100000 >> dd.log 2>&1
dd if=/dev/zero of=/disk/disk3/dd.out bs=8192 count=100000 >> dd.log 2>&1
dd if=/dev/zero of=/disk/disk3/dd.out bs=8192 count=100000 >> dd.log 2>&1

echo Reading /disk/disk3/dd.out >> dd.log
dd if=/disk/disk3/dd.out of=/dev/null bs=8192 count=100000 >> dd.log 2>&1
dd if=/disk/disk3/dd.out of=/dev/null bs=8192 count=100000 >> dd.log 2>&1
dd if=/disk/disk3/dd.out of=/dev/null bs=8192 count=100000 >> dd.log 2>&1

echo Writing /disk/disk4/dd.out >> dd.log
dd if=/dev/zero of=/disk/disk4/dd.out bs=8192 count=100000 >> dd.log 2>&1
dd if=/dev/zero of=/disk/disk4/dd.out bs=8192 count=100000 >> dd.log 2>&1
dd if=/dev/zero of=/disk/disk4/dd.out bs=8192 count=100000 >> dd.log 2>&1

echo Reading /disk/disk4/dd.out >> dd.log
dd if=/disk/disk4/dd.out of=/dev/null bs=8192 count=100000 >> dd.log 2>&1
dd if=/disk/disk4/dd.out of=/dev/null bs=8192 count=100000 >> dd.log 2>&1
dd if=/disk/disk4/dd.out of=/dev/null bs=8192 count=100000 >> dd.log 2>&1

rm -f /home/dd.out /var/tmp/dd.out /disk/disk2/dd.out /disk/disk3/dd.out /disk/disk4/dd.out

