#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

sudo cp -u $DIR/data/alacritty/alacritty /usr/local/bin/alacritty; 

if [[ ! -f .alacritty.yml ]]; then 
	cp $DIR/data/alacritty/.alacritty.yml ./; 
fi

