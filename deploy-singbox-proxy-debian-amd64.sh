#!/bin/bash

# !!! Please put ur sub url in place and remove that exit command !!!
exit

sudo apt update
sudo apt upgrade
mkdir tmp-singbox-inst
cd tmp-singbox-inst
wget http://ganlanc.at/mirrors/sing-box_1.12.8_linux_amd64.deb
sudo dpkg -i sing-box_1.12.8_linux_amd64.deb
wget # !!! PUT UR SING-BOX SUB URL HERE !!!
# concern about up line!
sudo mv /etc/sing-box/config.json /etc/sing-box/config.json.bak
sudo mv ./subscribe /etc/sing-box/config.json
# concern about ./subscribe!
sudo systemctl enable sing-box --now
