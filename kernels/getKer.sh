#!/bin/sh

ver="4.19.1"
foldname="linux-$ver"
pckname="$foldname.tar.xz"
wget -nc "https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.19.1.tar.xz"

if[ ! -d $foldname ] 
then 
	tar -xf "$pckname"
fi


