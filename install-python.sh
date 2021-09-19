#! /bin/bash

set -e

if [[ -z "$1" ]]; then
	echo "usage: install-python.sh VERSION"
	exit 1
fi

V=$1

sudo apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev

if [[ $V =~ ^[0-9].[0-9]+$ ]]; then
	if [[ ! -f "/tmp/python-versions.html" ]]; then
		curl -q https://www.python.org/downloads/ > /tmp/python-versions.html
	fi
	V=$(cat /tmp/python.html | grep -oE "Python $V.[0-9]+" | awk 'NR==1 {print $2}')
	echo "Chose version $V."
fi

cd /tmp
curl -O https://www.python.org/ftp/python/$V/Python-$V.tar.xz
tar -xf Python-$V.tar.xz
cd Python-$V
./configure --enable-optimizations
make -j $(($(nproc)-1))
sudo make altinstall
