#! /bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd /tmp
wget "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64" -O firefox.tar.bz2
tar -xjf firefox.tar.bz2
rm firefox.tar.bz2

sudo rm -Rf /usr/local/lib/firefox
sudo rm -f /usr/local/bin/firefox
sudo mv firefox /usr/local/lib/firefox

sudo ln -s  /usr/local/lib/firefox/firefox /usr/local/bin/firefox
cp -u $DIR/data/firefox/*.desktop ~/.local/share/applications/
