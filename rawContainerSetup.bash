#!/bin/bash
#First make sure curl is installed then run this in terminal like so:
#   source <(curl -s https://raw.githubusercontent.com/tux-box/Arma3epoch/refs/heads/main/rawContainerSetup.bash)

apt-get update && apt-get dist-upgrade -y
apt-get install -y nano openssh-server software-properties-common
dpkg --add-architecture i386
add-apt-repository multiverse
apt-get update
apt-get install steamcmd

ssh-keygen -q -t rsa -N '' <<< $'\ny' >/dev/null 2>&1
curl https://github.com/tux-box.keys >> ~/.ssh/authorized_keys
