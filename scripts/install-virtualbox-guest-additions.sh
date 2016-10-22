#!/bin/bash -eux

# Based on https://github.com/boxcutter/ubuntu/blob/2.0.23/script/virtualbox.sh

USERNAME=${SSH_USERNAME}

if [[ $PACKER_BUILDER_TYPE =~ virtualbox ]]; then
    VBOX_VERSION=$(cat /home/${USERNAME}/.vbox_version)
    
    # Assuming the following packages are installed
    apt-get install -y linux-headers-$(uname -r) build-essential perl
    apt-get install -y dkms

    echo "==> Installing VirtualBox guest additions"
    mount -o loop /home/${USERNAME}/VBoxGuestAdditions.iso /mnt
    sh /mnt/VBoxLinuxAdditions.run
    umount /mnt
    
    # Cleanup
    rm /home/${USERNAME}/VBoxGuestAdditions.iso
    rm /home/${USERNAME}/.vbox_version

    if [[ $VBOX_VERSION = "4.3.10" ]]; then
        ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions
    fi
fi
