#!/bin/bash

ata=$1

disk=$(ls -l /sys/block/ | grep $(grep "^${ata##ata}" /sys/class/scsi_host/host*/unique_id | sed "s/.*\(host[0-9]\{1,\}\).*/\1/") | awk '{print $8}')

if [ -z "$disk" ] ; then
	echo "$ata not found."
else
	echo /dev/$disk
fi

