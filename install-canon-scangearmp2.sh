#! /bin/bash

set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd /tmp
tar -xzf $DIR/data/canon-scangearmp2/scangearmp2-3.90-1-deb.tar.gz
cd scangearmp2-3.90-1-deb
sudo ./install.sh

