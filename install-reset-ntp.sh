#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

sudo cp -u $DIR/data/reset-ntp/reset-ntp.sh /usr/local/bin/reset-ntp
sudo cp -u $DIR/data/reset-ntp/reset-ntp.service /etc/systemd/system/reset-ntp.service

sudo chmod +x /usr/local/bin/reset-ntp
sudo systemctl enable reset-ntp.service

