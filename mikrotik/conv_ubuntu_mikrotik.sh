#!/bin/bash
wget https://download.mikrotik.com/routeros/6.48.6/chr-6.48.6.img.zip -O chr.img.zip
gunzip -c chr.img.zip > chr.img
echo u > /proc/sysrq-trigger
dd if=chr.img bs=1024 of=/dev/sda
echo "sync disk"
echo s > /proc/sysrq-trigger
echo "Sleep 5 seconds"
sleep 5
echo "Ok, reboot"
echo b > /proc/sysrq-trigger
