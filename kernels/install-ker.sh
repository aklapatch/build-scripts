#!/bin/sh

# kernel name is arg 1
if [ "$1"==""]
	echo "Usage: $0 kernelname"
fi

kername=$1

#install bcm module
dkms install broadcom-wl/6.30.223.271 -k "$kername"

mkinitcpio -k /boot/vmlinuz-4.18-x86_64 -c /etc/mkinitcpio.conf -g /boot/initramfs-4.18-x86_64.img 
mkinitcpio -k /boot/vmlinuz-4.18-x86_64 -c /etc/mkinitcpio.conf -g /boot/initramfs-4.18-x86_64-fallback.img -S autodetect

# install kernel
