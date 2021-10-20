#! /bin/bash
set -e

sudo rm /usr/bin/zoom

cat <<"EOF" > /tmp/zoom
#!/bin/sh
vblank_mode=0 /opt/zoom/ZoomLauncher "$@"
EOF

sudo install -m 0755 /tmp/zoom /usr/bin
