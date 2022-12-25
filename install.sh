#!/bin/bash

set -euo

if [[ ! $EUID == 0 ]]; then
        echo -e "run this script as root!"
	exit 1
fi

eselect repository enable guru 

eix-sync

emerge app-backup/grub-btrfs

if [[ -e /.snapshots ]]; then
	mkdir /.snapshots
fi

btrfs su sn / /.snapshots/snap_`date +%Y-%m-%d_%R:%S`

grub-mkconfig -o /boot/grub/grub.cfg



echo do not forget to add the service for snapshot autoconfiguration !!
