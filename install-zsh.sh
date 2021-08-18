#! /bin/bash

set -e

sudo apt install zsh -y


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


export RUNZSH=no
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh > /tmp/oh-my-zsh-install.sh

set +e
$(sudo test -d /root/.oh-my-zsh)
INSTALL_FOR_ROOT=$?
set -e


if [[ ! INSTALL_FOR_ROOT -eq 0 ]]; then
	echo "INSTALLING ZSH for root..."
	sudo sh /tmp/oh-my-zsh-install.sh --unattended
	
	sudo cp $DIR/data/zsh/.zshrc /root/
	sudo cp $DIR/data/zsh/custom-agnoster.zsh-theme /root/.oh-my-zsh/custom/themes/
	sudo chown -R root:root /root/.oh-my-zsh /root/.zshrc

	echo "INSTALLED ZSH for root"
else
	echo "SKIPPED INSTALLING ZSH for root"
fi


if [[ ! -d $HOME/.oh-my-zsh ]]; then
	echo "INSTALLING ZSH for $USER..."

	sh /tmp/oh-my-zsh-install.sh --unattended

	sudo cp $DIR/data/zsh/custom-agnoster.zsh-theme $HOME/.oh-my-zsh/custom/themes/
	cat $DIR/data/zsh/.zshrc | sed "s,/root,$HOME,g" | sed "s,root,$USER,g" > /$HOME/.zshrc

	chown -R $1:$1 $HOME/.oh-my-zsh $HOME/.zshrc

	echo "INSTALLED ZSH for $USER"
else
	echo "SKIPPED INSTALLING ZSH for $USER"
fi
