#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


sudo cp -u $DIR/data/apt/testing.list /etc/apt/sources.list.d/
sudo cp -u $DIR/data/apt/stable_pin /etc/apt/preferences.d/
sudo cp -u $DIR/data/apt/testing_pin /etc/apt/preferences.d/

sudo apt-get update
