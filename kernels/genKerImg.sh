#!/bin/sh

# kernel name is arg 1
if [ $# -eq 0 ]
then
	echo "Usage: $0 kernelname"
	exit
fi

kername=$1

#install bcm module
sudo dkms install broadcom-wl/6.30.223.271 -k "$kername"

# generate kernel initramfs
sudo mkinitcpio -k /boot/vmlinuz -c /etc/mkinitcpio.conf -g "/boot/initramfs-$kername.img" -S autodetect

# update grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
