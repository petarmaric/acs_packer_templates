#!/bin/bash -eux

# Based on https://github.com/boxcutter/ubuntu/blob/2.0.23/script/minimize.sh
# and https://github.com/boxcutter/ubuntu/blob/2.0.23/script/cleanup.sh

DISK_USAGE_BEFORE=$(df -h / | tail -n1 | awk -F ' ' '{print $3}')


echo "==> Removing all linux kernels except the currrent one"
dpkg --list | awk '{ print $2 }' | grep 'linux-image-3.*-generic' | grep -v $(uname -r) | xargs apt-get -y purge

echo "==> Removing linux source"
dpkg --list | awk '{ print $2 }' | grep linux-source | xargs apt-get -y purge


echo "==> Cleaning up unused APT packages, downloads, caches and other supporting files"
apt-get -q -y autoremove --purge
apt-get -q -y autoclean
apt-get -q -y clean
find /var/lib/apt -type f | xargs rm -f

echo "==> Cleaning up /var/cache"
find /var/cache -type f -exec rm -rf {} \;


echo "==> Disk usage before minimization: ${DISK_USAGE_BEFORE}"

DISK_USAGE_AFTER=$(df -h / | tail -n1 | awk -F ' ' '{print $3}')
echo "==> Disk usage after minimization:  ${DISK_USAGE_AFTER}"
