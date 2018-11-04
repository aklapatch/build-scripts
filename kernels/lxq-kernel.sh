#!/bin/sh

ver="4.18.16"
packname="v$ver-lqx2.tar.gz"

#zen-kernel-4.18.16-lqx1
foldername="zen-kernel-$ver-lqx2"
wget -nc "https://github.com/zen-kernel/zen-kernel/archive/$packname"

#https://github.com/zen-kernel/zen-kernel/archive/v4.18.16-lqx1.tar.gz

if [ ! -d "$foldername" ]; then
	tar -xf "$packname"
fi

cd "$foldername"

make menuconfig

printf "Run:\n make -j4\nmake modules_install\nmake install\nsudo grub-mkconfig -o /boot/grub/grub.cfg"

