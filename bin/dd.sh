#!/bin/sh

# Copyright(c) 2013 Uptime Technologies, LLC.

echo /home/dd.out
dd if=/dev/zero of=/home/dd.out bs=8192 count=100000
dd if=/dev/zero of=/home/dd.out bs=8192 count=100000
dd if=/dev/zero of=/home/dd.out bs=8192 count=100000

echo /var/tmp/dd.out
dd if=/dev/zero of=/var/tmp/dd.out bs=8192 count=100000
dd if=/dev/zero of=/var/tmp/dd.out bs=8192 count=100000
dd if=/dev/zero of=/var/tmp/dd.out bs=8192 count=100000

echo /disk/disk2/dd.out
dd if=/dev/zero of=/disk/disk2/dd.out bs=8192 count=100000
dd if=/dev/zero of=/disk/disk2/dd.out bs=8192 count=100000
dd if=/dev/zero of=/disk/disk2/dd.out bs=8192 count=100000

echo /disk/disk3/dd.out
dd if=/dev/zero of=/disk/disk3/dd.out bs=8192 count=100000
dd if=/dev/zero of=/disk/disk3/dd.out bs=8192 count=100000
dd if=/dev/zero of=/disk/disk3/dd.out bs=8192 count=100000

echo /disk/disk4/dd.out
dd if=/dev/zero of=/disk/disk4/dd.out bs=8192 count=100000
dd if=/dev/zero of=/disk/disk4/dd.out bs=8192 count=100000
dd if=/dev/zero of=/disk/disk4/dd.out bs=8192 count=100000

rm -f /home/dd.out /var/tmp/dd.out /disk/disk2/dd.out /disk/disk3/dd.out /disk/disk4/dd.out

