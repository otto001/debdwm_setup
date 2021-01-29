#! /bin/bash

set -e

cd /tmp
wget "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64" -O firefox.tar.bz2
tar -xjf firefox.tar.bz2
rm firefox.tar.bz2

mv firefox /usr/local/lib/firefox

set +e
ln -s  /usr/local/lib/firefox/firefox /usr/local/bin/firefox
