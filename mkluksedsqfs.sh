#!/bin/bash

read -p "Please enter your File Directory:" directory
read -p "Please enter your Backup Filename:" filename

sudo mksquashfs "${directory}" "${filename}"
sudo truncate -s +8M "${filename}"
sudo cryptsetup reencrypt --type luks2 --resilience none --disable-locks --reduce-device-size 8M --encrypt "${filename}"
