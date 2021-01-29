#! /bin/bash
set -e
cd /tmp
curl https://getmic.ro | bash
cp micro /usr/local/bin/micro
