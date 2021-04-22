#! /bin/bash

set -e
sudo mkdir -p /lib/firmware/rtl_nic
cd /lib/firmware/rtl_nic

sudo wget https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/rtl_nic/rtl8125b-2.fw
echo "You might need to run 'update-initramfs' & reboot for changes to have effect."
