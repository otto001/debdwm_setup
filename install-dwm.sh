#! /bin/bash

# exit when something fails
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $HOME

sudo apt install nitrogen suckless-tools compton xss-lock  -y
sudo apt install build-essential libx11-dev libxinerama-dev libxft-dev libxrandr-dev sharutils -y

rm -f /usr/bin/slock

function gitinstall {
	if [[ -d $1 ]]; then
		cd $1
		git pull || return 0
	else
		git clone http://github.com/otto001/$1
		cd $1
		if [[ ! -f config.h ]] && [[ -f config.def.h ]]; then
			cp config.def.h config.h
		fi
	fi
	

	sudo make clean install
	cd ..
}

mkdir -p suckless
cd suckless

gitinstall dwm
gitinstall slstatus
gitinstall dmenu
gitinstall slock

gitinstall dpower
gitinstall dblue
gitinstall daudio

if [ "$1" == "laptop" ]; then
	sudo apt install xbacklight -y
	gitinstall dlight
fi

sudo chown -R $USERNAME:$USERNAME ./*

sudo cp $DIR/data/dwm/dwm.desktop /usr/share/xsessions/dwm.desktop

mkdir -p ~/.dwm
cp $DIR/data/dwm/autostart ~/.dwm/autostart.sh
cp $DIR/data/xconfig/* ~/

