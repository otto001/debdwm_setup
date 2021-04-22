#!/bin/bash

exec compton -b --vsync opengl-swc --paint-on-overlay &
exec slstatus &
exec nitrogen --restore &

nohup bash -c "sleep 3 && setxkbmap us && xmodmap ~/.Xmodmap" &

xset s 600
xss-lock slock &

if [ -f "./autostartExtra.sh" ]; then
    bash ./autostartExtra.sh
fi
