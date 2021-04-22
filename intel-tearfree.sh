#! /bin/bash

# exit when something fails
set -e

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

sudo mkdir -p /etc/X11/xorg.conf.d/
sudo cp $DIR/data/tearfree/20-intel.conf /etc/X11/xorg.conf.d/20-intel.conf

echo "Success. Please reboot to see effect."
