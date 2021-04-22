#! /bin/bash

set -e

cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O chrome.deb
sudo apt install ./chrome.deb
rm ./chrome.deb

set +e
sudo ln -s  /usr/bin/google-chrome /usr/bin/chrome
