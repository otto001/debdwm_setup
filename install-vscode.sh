#! /bin/bash

set -e

cd /tmp
#curl https://code.visualstudio.com/docs/setup/linux | grep -E "<a.*\.deb package" | grep -Eo "https://[a-zA-Z0-9\-_\?\&\./=\+]+" | xargs curl -o vscode.deb
wget https://update.code.visualstudio.com/latest/linux-deb-x64/stable -O vscode.deb

apt install ./vscode.deb
rm ./vscode.deb
