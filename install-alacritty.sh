#! /bin/bash

sudo cp -u $DIR/data/alacritty/alacritty /usr/local/bin/alacritty; 

if [[ ! -f .alacritty.yml ]]; then 
	cp $DIR/data/alacritty/.alacritty.yml ./; 
fi

