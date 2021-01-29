#! /bin/bash

set -e

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi


tool_short_name=$1
tool=$2

if [ -z "$tool_short_name" ] || [ -z "$tool" ]; then
	me=`basename "$0"`
	echo "usage: ${me} shortname installname
	e.g.: ${me} PCP pycharm
	      ${me} CL clion" 
	exit -1
fi

installdir="/usr/local/share/$tool"
binfile="/usr/local/bin/$tool"
#https://www.jetbrains.com/de-de/pycharm/download/download-thanks.html?platform=linux

cd /tmp
#wget https://download-cf.jetbrains.com/python/pycharm-professional-2020.3.2.tar.gz
wget "https://data.services.jetbrains.com/products/download?code=${tool_short_name}&platform=linux" -O ${tool}.tar.gz -q
tar -xzf ${tool}.tar.gz
echo "downloaded and unpacked ${tool}"

mv $(ls /tmp | grep -i ${tool}-) ${tool}_new

if [ -d $installdir ]; then
	mv $installdir /tmp/${tool}_old
fi

mv ${tool}_new $installdir

#if [ -d /usr/local/bin/$tool ]; then
#	rm /usr/local/bin/$tool
#fi
echo "#! /bin/sh
wmname LG3D
${installdir}/bin/${tool}.sh
" > $binfile
chmod +x $binfile

echo "copied program files to ${installdir} and added startup script to ${binfile}"

