#!/bin/sh

ver="4.18.16"
clear_ver="$ver-650"
foldername="linux-$clear_ver"
packname="$clear_ver.tar.gz"
#https://github.com/clearlinux-pkgs/linux/archive/4.18.16-650.tar.gz
#get clear linux patches
foldername="linux-$clear_ver"
wget -nc "https://github.com/clearlinux-pkgs/linux/archive/$clear_ver.tar.gz"

# get linux kernel 
kfoldername="linux-$ver"
kpackname="$kfoldername.tar.xz"
wget -nc "https://cdn.kernel.org/pub/linux/kernel/v4.x/$kpackname"

# extract files
if [ ! -d "$foldername" ]; then
	tar -xf "$packname"
fi
if [ ! -d "$kfoldername" ]; then
	tar -xf "$kpackname"
fi

# get patches into kernel folder
cp -r $foldername/* "$kfoldername"

cd "$kfoldername"

# apply patches
for ptch in *.patch;
do
	patch -p1  -i "$ptch"
done
#make menuconfig

printf "Run:\n make -j4\nmake modules_install\nmake install\n"
printf "sudo grub-mkconfig -o /boot/grub/grub.cfg"

