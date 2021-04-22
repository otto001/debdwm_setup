#!/bin/sh

## scaling & stuff
xrdb -merge ~/.Xresources

## jetbrains
export _JAVA_AWT_WM_NONREPARENTING=1 
export AWT_TOOLKIT=MToolkit 
wmname LG3D

setxkbmap us
xmodmap ~/.Xmodmap
