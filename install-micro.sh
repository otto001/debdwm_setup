#! /bin/bash
set -e
cd /tmp
curl https://getmic.ro | bash
sudo cp micro /usr/local/bin/micro
