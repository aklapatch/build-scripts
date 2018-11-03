#!/bin/sh

ver="4.18.16"
clear_ver="$ver-650"
foldername="linux-$clear_ver"
packname="$clear_ver.tar.gz"
#https://github.com/clearlinux-pkgs/linux/archive/4.18.16-650.tar.gz
#get clear linux patches
foldername="linux-$clear_ver"
wget -nc "https://github.com/clearlinux-pkgs/linux/archive/$clear_ver.tar.gz"

#https://github.com/zen-kernel/zen-kernel/archive/v4.18.16-lqx1.tar.gz

# get linux kernel 

#kfoldername="linux-$ver"
#kpackname="$kfoldername.tar.xz"
#wget -nc "https://cdn.kernel.org/pub/linux/kernel/v4.x/$kpackname"

wget -nc "https://github.com/zen-kernel/zen-kernel/archive/v$ver-lqx2.tar.gz"
kfoldername="zen-kernel-$ver-lqx2"

# extract files
if [ ! -d "$foldername" ]; then
	tar -xf "$packname"
fi
if [ ! -d "$kfoldername" ]; then
	tar -xf "v$ver-lqx2.tar.gz"
fi

cd "$kfoldername"

# apply patches
for ptch in ../$foldername/*.patch;
do
	patch -p1  -i "../$foldername/$ptch"
done
#make menuconfig

printf "Run:\n make -j4\nmake modules_install\nmake install\n"
printf "sudo grub-mkconfig -o /boot/grub/grub.cfg"

