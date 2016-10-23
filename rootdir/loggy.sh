#!/bin/sh
# loggy.sh.

date=`date +%F_%H-%M-%S`
lsmod > /storage/sdcard0/lsmod_${date}.txt
logcat -v time -f  /storage/sdcard0/logcat_${date}.txt
