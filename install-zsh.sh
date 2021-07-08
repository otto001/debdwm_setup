#! /bin/bash

set -e

sudo apt install zsh -y
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

mkdir -p /tmp/zsh
cd /tmp/zsh
rm -Rf *
tar -xzf $DIR/data/zsh/oh-my-zsh.tar.gz

if [[ ! -d /root/.zshrc ]]; then
	sudo cp -ur /tmp/zsh/.oh-my-zsh /root/
	sudo cp -ur $DIR/data/zsh/.zshrc /root/
	sudo chown -R root:root /root/.oh-my-zsh /root/.zshrc
fi

if [[ ! -d $HOME/.zshrc ]]; then
	cat $DIR/data/zsh/.zshrc | sed "s,/root,$HOME,g" | sed "s,root,$USER,g" > /tmp/.zshrc
	cp -ur /tmp/.zshrc $HOME/.zshrc
	cp -ur /tmp/zsh/.oh-my-zsh $HOME
	chown -R $1:$1 $HOME/.oh-my-zsh $HOME/.zshrc
fi

rm -Rf /tmp/zsh
