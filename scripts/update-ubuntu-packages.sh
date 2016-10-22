#!/bin/bash -eux

# Based on https://github.com/boxcutter/ubuntu/blob/2.0.23/script/update.sh

echo "==> Updating list of repositories"
# apt-get update does not actually perform updates, it just downloads and indexes the list of packages
apt-get -qq -y update

echo "==> Performing dist-upgrade (all packages and kernel)"
apt-get -q -y dist-upgrade
reboot
sleep 60
