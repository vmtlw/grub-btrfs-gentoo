#!/bin/bash


eselect repository enable guru 

eix-sync

emerge app-backup/grub-btrfs

if [[ -e /.snapshots ]]; then
	mkdir /.snapshots

btrfs su sn / /.snapshots/snap_`date +%Y-%m-%d_%R:%S`

grub-mkconfig -o /boot/grub/grub.cfg



echo do not forget to add the service for snapshot autoconfiguration !!
