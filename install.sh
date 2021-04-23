#! /bin/bash

# exit when something fails
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


cd $HOME
if [[ ! -f .gitconfig ]]; then cp $DIR/data/git/.gitconfig ./; fi


sudo apt update -y
sudo apt upgrade -y

sudo apt install git wget curl xinput xclip -y

git config --global credential.helper store
git config --global pull.rebase false

sudo git config --global user.email "root@root.root"
sudo git config --global user.name "ludwg root"

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

$DIR/setup-sleep.sh

checkinstall /usr/local/share/fonts/FiraCode-Regular.ttf install-firacode.sh

checkinstall /usr/local/bin/alacritty install-alacritty.sh
checkinstall /usr/bin/zsh install-zsh.sh

checkinstall ./suckless install-dwm.sh

checkinstall /usr/local/bin/python3.8 install-python.sh "3.8.7"

checkinstall /usr/local/bin/micro install-micro.sh
checkinstall /usr/bin/code install-vscode.sh

checkinstall /usr/bin/chrome install-chrome.sh
checkinstall /usr/local/bin/firefox install-firefox.sh

checkinstall /usr/local/bin/pycharm install-jetbrains.sh PCP pycharm
checkinstall /usr/local/bin/clion install-jetbrains.sh CL clion
checkinstall /usr/local/bin/webstorm install-jetbrains.sh WS webstorm

#checkinstall /usr/bin/psql install-postgresql-13.sh $USER

sudo apt install npm -y

# sudoers file -- apparently not needed anymore
#sed -i 's/#includedir \/etc\/sudoers.d/includedir /etc/sudoers.d/'
#mkdir -p /etc/sudoers.d/
#cp $DIR/sudoers-poweroff /etc/sudoers.d/powermanagment

# sudo groups
sudo /sbin/adduser $USER sudo
echo "User $USER might have to logout&login again to be able to use sudo"

