#!/bin/bash

nohup bash -c "setxkbmap us && xmodmap ~/.Xmodmap" &
nohup bash -c "sleep 3 && setxkbmap us && xmodmap ~/.Xmodmap" &
