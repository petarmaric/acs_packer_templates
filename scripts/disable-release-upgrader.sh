#!/bin/bash -eux

# Based on https://github.com/boxcutter/ubuntu/blob/2.0.23/script/update.sh

# Disable the release upgrader
echo "==> Disabling the release upgrader"
sed -i.bak 's/^Prompt=.*$/Prompt=never/' /etc/update-manager/release-upgrades
