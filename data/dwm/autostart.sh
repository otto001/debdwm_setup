#!/bin/bash

exec slstatus &

for f in ${BASH_SOURCE%/*}/autostart.d/*.sh; do
  bash "$f" 
done
