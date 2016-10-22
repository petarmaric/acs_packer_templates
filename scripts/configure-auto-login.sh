#!/bin/bash

# Based on https://github.com/boxcutter/ubuntu/blob/2.0.23/script/desktop.sh

USERNAME=${SSH_USERNAME}

configure_ubuntu1204_autologin()
{
    LIGHTDM_CONFIG=/etc/lightdm/lightdm.conf

    echo "==> Configuring lightdm autologin"
    if [ -f $LIGHTDM_CONFIG ]; then
        echo "" >> $LIGHTDM_CONFIG
        echo "autologin-user=${USERNAME}" >> $LIGHTDM_CONFIG
        echo "autologin-user-timeout=0" >> $LIGHTDM_CONFIG
    fi
}

. /etc/lsb-release

if [[ $DISTRIB_RELEASE == 12.04 ]]; then

    configure_ubuntu1204_autologin

elif [[ $DISTRIB_RELEASE == 14.04 || $DISTRIB_RELEASE == 16.04 ]]; then
    LIGHTDM_CONFIG=/etc/lightdm/lightdm.conf
    GDM_CUSTOM_CONFIG=/etc/gdm/custom.conf

    mkdir -p $(dirname ${GDM_CUSTOM_CONFIG})
    echo "[daemon]" >> $GDM_CUSTOM_CONFIG
    echo "# Enabling automatic login" >> $GDM_CUSTOM_CONFIG
    echo "AutomaticLoginEnable=True" >> $GDM_CUSTOM_CONFIG
    echo "AutomaticLoginEnable=${USERNAME}" >> $GDM_CUSTOM_CONFIG

    echo "==> Configuring lightdm autologin"
    echo "[SeatDefaults]" >> $LIGHTDM_CONFIG
    echo "autologin-user=${USERNAME}" >> $LIGHTDM_CONFIG
fi
