#!/bin/sh

# provision elasticsearch user
addgroup sudo
adduser -D -g '' elasticsearch
adduser elasticsearch sudo
chown -R elasticsearch /elasticsearch /data
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# allow for memlock
echo "Resetting Limits: "
ulimit -l unlimited
sudo sysctl -w vm.max_map_count=262144
echo "Done"

# run
sudo -E -u elasticsearch /elasticsearch/bin/elasticsearch
