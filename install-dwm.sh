#! /bin/bash

# exit when something fails
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
RES=""

cd ~

sudo apt-get install nitrogen suckless-tools compton xss-lock  -y -q
sudo apt-get install build-essential libx11-dev libxinerama-dev libxft-dev libxrandr-dev sharutils -y -q

rm -f /usr/bin/slock

set +e

function gitinstall {
	cd ~/suckless
	echo "installing/updating $1..."
	if [[ -d $1 ]]; then
		cd $1
		git pull

		if [[ $? -ne 0 ]]; then
			RES="$RES\nERROR   installing/updating $1: git pull failed"
			return 0
		fi
		
	else
		git clone http://github.com/otto001/$1
		cd $1
		if [[ ! -f config.h ]] && [[ -f config.def.h ]]; then
			cp config.def.h config.h
		fi
	fi
	
	sudo make clean install > /dev/null
	if [[ $? -eq 0 ]]; then
		RES="$RES\nSUCCESS installing/updating $1"
	else
		RES="$RES\nERROR   installing/updating $1: make failed"
	fi

}

mkdir -p ~/suckless
cd ~/suckless

gitinstall dwm
gitinstall slstatus
gitinstall dmenu
gitinstall slock

gitinstall dpower
gitinstall dblue
gitinstall daudio

cd ~/suckless


if [ ! -z "$(ls -A /sys/class/backlight)" ]; then
   	sudo apt install xbacklight -y -q
	gitinstall dlight
fi

# xss-lock custom version
sudo wget https://github.com/otto001/xss-lock/releases/download/v0.3.1/xss-lock-debian -q -O /usr/local/bin/xss-lock

set -e

sudo chown -R $USERNAME:$USERNAME ./*

sudo cp $DIR/data/dwm/dwm.desktop /usr/share/xsessions/dwm.desktop

mkdir -p ~/.dwm
cp $DIR/data/dwm/autostart.sh ~/.dwm/autostart.sh


cd $HOME
mkdir -p /tmp/xconfig/
cp -u .Xresources .xinitrc .Xmodmap .xsession /tmp/xconfig/

cd $DIR/data/xconfig
cp -u .Xresources .xinitrc .Xmodmap .xsession ~/

echo -e $RES
