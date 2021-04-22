#! /bin/bash

set -e


cd /tmp
curl -fsSL https://get.docker.com -o get-docker.sh
sudo /bin/bash /tmp/get-docker.sh

sudo /sbin/adduser $USER docker
