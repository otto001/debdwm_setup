#! /bin/bash

set -e

sudo apt install zsh -y
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

mkdir -p /tmp/zsh
cd /tmp/zsh
rm -Rf *
tar -xzf $DIR/data/zsh/zsh-config.tar.gz
if [[ ! -d /root/.oh-my-zsh ]]; then
	sudo cp -r .oh-my-zsh /root/
	sudo cp -r .zshrc /root/
	sudo chown -R root:root /root/.oh-my-zsh /root/.zshrc
fi

if [[ ! -d $HOME/.oh-my-zsh ]]; then
	cp -r .oh-my-zsh $HOME
	cat .zshrc | sed "s,/root/,$HOME,g" | sed "s,root,$USER,g" > $HOME/.zshrc
	chown -R $1:$1 $HOME/.oh-my-zsh $HOME/.zshrc
fi
rm -Rf /tmp/zsh
