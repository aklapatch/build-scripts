#!/bin/sh

# kernel name is arg 1
if [ $# -lt 2 ]
then
	echo "Usage: $0 buildDir kernelName"
	exit
fi

kername=$2

cd "$1"
make -j 3

sudo make -j 3 modules_install headers_install install

#install bcm module
sudo dkms install broadcom-wl/6.30.223.271 -k "$kername"

# generate kernel initramfs
sudo mkinitcpio -k /boot/vmlinuz -c /etc/mkinitcpio.conf -g "/boot/initramfs-$kername.img" -S autodetect

# update grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "Remember to set the initrd to include the intel_ucode."