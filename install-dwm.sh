#! /bin/bash

# exit when something fails
set -e

if [[ ! -v 1 ]] || [[ ! -v 2 ]]; then
	echo "usage: install-dwm.sh USERNAME HOMEDIR"
	exit 1
fi

USERNAME=$1
HOMEDIR="$(echo ${2%/})/"

cd $HOMEDIR

apt install nitrogen suckless-tools compton -y
apt install build-essential libx11-dev libxinerama-dev libxft-dev sharutils -y

function gitinstall {
	git clone http://github.com/otto001/$1
	cd $1
	if [[ ! -f config.h ]] && [[ -f config.def.h ]]; then
		cp config.def.h config.h
	fi
	make clean install
	cd ..
}

mkdir -p suckless
cd suckless

gitinstall dwm
gitinstall dwm_vol
gitinstall slstatus
gitinstall dmenu

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cp $DIR/dwm.desktop /usr/share/xsessions/dwm.desktop

tar -xzf $DIR/dwm-home.tar.gz
chown -R $USERNAME:$USERNAME ./*