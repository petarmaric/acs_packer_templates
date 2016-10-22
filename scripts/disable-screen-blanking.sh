#!/bin/bash

# Based on https://github.com/boxcutter/ubuntu/blob/2.0.23/script/desktop.sh

echo "==> Disabling screen blanking"
NODPMS_CONFIG=/etc/xdg/autostart/nodpms.desktop
echo "[Desktop Entry]" >> $NODPMS_CONFIG
echo "Type=Application" >> $NODPMS_CONFIG
echo "Exec=xset -dpms s off s noblank s 0 0 s noexpose" >> $NODPMS_CONFIG
echo "Hidden=false" >> $NODPMS_CONFIG
echo "NoDisplay=false" >> $NODPMS_CONFIG
echo "X-GNOME-Autostart-enabled=true" >> $NODPMS_CONFIG
echo "Name[en_US]=nodpms" >> $NODPMS_CONFIG
echo "Name=nodpms" >> $NODPMS_CONFIG
echo "Comment[en_US]=" >> $NODPMS_CONFIG
echo "Comment=" >> $NODPMS_CONFIG
