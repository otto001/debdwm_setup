#! /bin/bash
set -e


wget https://zoom.us/client/latest/zoom_amd64.deb -O /tmp/zoom.deb
sudo apt install /tmp/zoom.deb

if lsmod | grep "i915" &> /dev/null ; then
  sudo rm /usr/bin/zoom
  
  cat >/tmp/zoom <<EOL
#!/bin/sh
vblank_mode=0 /opt/zoom/ZoomLauncher "$@"
EOL
  
  sudo install -m 0755 /tmp/zoom /usr/bin

  echo "Added hotfix for i915 driver that disables vsync for zoom."
fi


