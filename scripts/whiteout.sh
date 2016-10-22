#!/bin/bash -eux

# Based on https://github.com/boxcutter/ubuntu/blob/2.0.23/script/cleanup.sh

USERNAME=${SSH_USERNAME}


echo "==> Cleaning up /tmp"
rm -rf /tmp/*

echo "==> Removing Bash history"
unset HISTFILE
rm -f /root/.bash_history
rm -f /home/${USERNAME}/.bash_history

echo "==> Clearing all log files"
find /var/log -type f | while read f; do echo -ne '' > "${f}"; done;

echo "==> Clearing the last login information"
>/var/log/lastlog
>/var/log/wtmp
>/var/log/btmp


echo "==> Whiteout the root partition to reduce the VirtualBox image size"
count=$(df --sync -kP / | tail -n1  | awk -F ' ' '{print $4}')
let count--
dd if=/dev/zero of=/tmp/whitespace bs=1024 count=$count
rm /tmp/whitespace

set +e
swappart=$(/sbin/blkid -o device -l -t TYPE=swap)
case "$?" in
    2|0) ;;
    *) exit 1 ;;
esac
set -e
if [ "x${swappart}" != "x" ]; then
    echo '==> Whiteout the swap partition to reduce the VirtualBox image size'
    # Swap will be disabled untill reboot
    /sbin/swapoff "${swappart}"
    dd if=/dev/zero of="${swappart}" bs=1M || echo "dd exit code $? is suppressed"
    /sbin/mkswap "${swappart}"
fi


# Make sure we wait until all the data is written to disk, otherwise
# Packer might quite too early before the large files are deleted
sync
