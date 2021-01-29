#! /bin/bash

# exit when something fails
set -e

if [[ ! -v 1 ]]; then
	echo "usage: install.sh USERNAME"
	exit 1
fi

USER="$1"
HOMEDIR="/home/$USER/"


if [[ ! -d $HOMEDIR ]]; then
	echo "Error: Can't find dir $HOMEDIR"
	exit 1
fi

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# unpacking/copying stuff
if [[ ! -f /usr/local/bin/alacritty ]]; then cp $DIR/alacritty /usr/local/bin/alacritty; fi

cd /usr/local/share/fonts/ && tar -xzf $DIR/fira-code.tar.gz --skip-old-files 

cd $HOMEDIR
tar -xzf $DIR/x-config-files.tar.gz --skip-old-files 
if [[ ! -f .alacritty.yml ]]; then cp $DIR/.alacritty.yml ./; fi
if [[ ! -f .gitconfig ]]; then cp $DIR/.gitconfig ./; fi


# fix desktop theme (otherwise firefox esr wont upgrade)
set +e
rm /usr/share/desktop-base/active-theme
ln -s /etc/alternatives/desktop-theme /usr/share/desktop-base/active-theme
set -e

apt update -y
apt upgrade -y

apt install git wget curl xinput xclip -y

git config --global credential.helper store

function checkinstall {
	install_script=$DIR/$2
	if [ ! -e $1 ]; then
		shift
		shift
		echo "running $install_script $@"
		bash $install_script $@
	else
		shift
		echo "skipping $@, already installed"
	fi
}


checkinstall ./suckless install-dwm.sh $USER $HOMEDIR
checkinstall /usr/local/bin/python3.8 install-python.sh "3.8.7"
checkinstall /usr/local/bin/micro install-micro.sh
checkinstall /usr/bin/zsh install-zsh.sh $USER $HOMEDIR
checkinstall /usr/bin/code install-vscode.sh
checkinstall /usr/bin/chrome install-chrome.sh
checkinstall /usr/local/bin/firefox install-firefox.sh


checkinstall /usr/local/bin/pycharm install-jetbrains.sh PCP pycharm
checkinstall /usr/local/bin/clion install-jetbrains.sh CL clion
checkinstall /usr/local/bin/webstorm install-jetbrains.sh WS webstorm


checkinstall /usr/bin/psql install-postgresql-13.sh $USER

apt install npm -y

# sudoers file -- apparently not needed anymore
#sed -i 's/#includedir \/etc\/sudoers.d/includedir /etc/sudoers.d/'
#mkdir -p /etc/sudoers.d/
#cp $DIR/sudoers-poweroff /etc/sudoers.d/powermanagment

# sudo groups
/sbin/adduser $USER sudo
echo "User $USER must logout&login again to be able to use sudo"

