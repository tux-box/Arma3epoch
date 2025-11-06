#!/bin/bash
#First make sure curl is installed then run this in terminal like so:
#   source <(curl -s https://raw.githubusercontent.com/tux-box/Arma3epoch/refs/heads/main/rawContainerSetup.bash)

echo "Adding x86 Arch"
dpkg --add-architecture i386

echo "Adding multiverse"
add-apt-repository multiverse

echo "updating lists and performing upgrades"
apt-get update && apt-get dist-upgrade -y

#by running my script you agree to the Steam agreement, not me. You are responcable not me!
echo "the user aggress to the steam aggrement"
echo steam steam/question select "I AGREE" | sudo debconf-set-selections
echo steam steam/license note '' | sudo debconf-set-selections

echo "installing pre-requesits"
apt-get install -y nano openssh-server software-properties-common git steamcmd

echo "setting up ssh"
ssh-keygen -q -t rsa -N '' <<< $'\ny' >/dev/null 2>&1
#>> is append, > is overwrite
curl https://github.com/tux-box.keys > ~/.ssh/authorized_keys

git clone https://github.com/tux-box/Arma3epoch.git /epochSource

