#!/bin/sh

if [ ! -d "$1" ]; then
	echo "Directory does not exist. Please specify a correct directory"
	exit
fi

cd "$1"
make -j 3

sudo make modules_install headers_install install
