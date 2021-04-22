#! /bin/bash

set -e

if [[ -z "$1" ]]; then
	echo "usage: install-python.sh VERSION"
	exit 1
fi

V=$1

sudo apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev

cd /tmp
curl -O https://www.python.org/ftp/python/$V/Python-$V.tar.xz
tar -xf Python-$V.tar.xz
cd Python-$V
./configure --enable-optimizations
make -j 4
sudo make altinstall
