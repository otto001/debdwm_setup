#! /bin/bash

if [[ ! -f /usr/local/bin/alacritty ]]; then 
	sudo cp $DIR/data/alacritty/alacritty /usr/local/bin/alacritty; 
fi

if [[ ! -f .alacritty.yml ]]; then 
	cp $DIR/data/alacritty/.alacritty.yml ./; 
fi

