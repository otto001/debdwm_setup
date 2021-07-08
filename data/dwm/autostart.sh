#!/bin/bash

exec compton -b --vsync opengl-swc --paint-on-overlay &
exec slstatus &
exec nitrogen --restore &

nohup bash -c "setxkbmap us && xmodmap ~/.Xmodmap" &
nohup bash -c "sleep 3 && setxkbmap us && xmodmap ~/.Xmodmap" &

xset s 600
xss-lock slock &

if [ -f "${BASH_SOURCE%/*}/autostartExtra.sh" ]; then
    bash ${BASH_SOURCE%/*}/autostartExtra.sh
fi
