#! /bin/bash
set -e

if lsmod | grep "i915" &> /dev/null ; then
  sudo rm /usr/bin/zoom
  
  cat <<"EOF" > /tmp/zoom
  #!/bin/sh
  vblank_mode=0 /opt/zoom/ZoomLauncher "$@"
  EOF
  
  sudo install -m 0755 /tmp/zoom /usr/bin

  echo "Added hotfix for i915 driver that disabled vsync"
fi


