#! /bin/bash

set -e

if [[ ! -v 1 ]] || [[ ! -v 2 ]]; then
	echo "usage: install-zsh.sh USERNAME HOMEDIR"
	exit 1
fi

USERNAME=$1
HOMEDIR="$(echo ${2%/})/"


apt install zsh -y
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

mkdir -p /tmp/zsh
cd /tmp/zsh
rm -Rf *
tar -xzf $DIR/zsh-config.tar.gz
if [[ ! -d /root/.oh-my-zsh ]]; then
	cp -r .oh-my-zsh /root/
	cp -r .zshrc /root/
	chown -R root:root /root/.oh-my-zsh /root/.zshrc
fi

if [[ ! -d $HOMEDIR.oh-my-zsh ]]; then
	cp -r .oh-my-zsh $HOMEDIR
	cat .zshrc | sed "s,/root/,$HOMEDIR,g" | sed "s,root,$USERNAME,g" > $HOMEDIR.zshrc
	chown -R $1:$1 $HOMEDIR.oh-my-zsh $HOMEDIR.zshrc
fi
rm -R /tmp/zsh