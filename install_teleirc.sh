set -e

VER=2.3.0
echo "Selecting TeleIRC version ${VER}..."

echo "Downloading TeleIRC deployment assets from GitHub..."
curl --location --output ~/teleirc https://github.com/RITlug/teleirc/releases/download/v${VER}/teleirc-${VER}-linux-x86_64
curl --location --output ~/teleirc.sysusers https://raw.githubusercontent.com/RITlug/teleirc/v${VER}/deployments/systemd/teleirc.sysusers
curl --location --output ~/teleirc.tmpfiles https://raw.githubusercontent.com/RITlug/teleirc/v${VER}/deployments/systemd/teleirc.tmpfiles
curl --location --output ~/teleirc@.service https://raw.githubusercontent.com/RITlug/teleirc/v${VER}/deployments/systemd/teleirc@.service
curl --location --output ~/teleirc.env https://raw.githubusercontent.com/RITlug/teleirc/v${VER}/env.example

echo "Please edit the TeleIRC environment file to configure your bridge settings..."
vim ~/teleirc.env
echo "Please make sure you configured TeleIRC correctly in ~/teleirc.env before proceeding!"
echo "Press any key to continue..."
read nothing

echo "Installing TeleIRC files and user..."
sudo install -Dm755 -o root -g root ~/teleirc /usr/local/bin/teleirc
sudo install -Dm644 -o root -g root ~/teleirc.sysusers /etc/sysusers.d/teleirc.conf
sudo install -Dm644 -o root -g root ~/teleirc.tmpfiles /etc/tmpfiles.d/teleirc.conf
sudo install -Dm644 -o root -g root ~/teleirc@.service /etc/systemd/system/teleirc@.service
sudo systemd-sysusers /etc/sysusers.d/teleirc.conf
sudo systemd-tmpfiles --create /etc/tmpfiles.d/teleirc.conf
sudo install -Dm644 -o root -g root ~/teleirc.env /etc/teleirc/bridge

echo "Cleaning up temporary files..."
rm ~/teleirc ~/teleirc.sysusers ~/teleirc.tmpfiles ~/teleirc@.service ~/teleirc.env

echo "Starting and enabling TeleIRC..."
sudo systemctl enable --now teleirc@bridge.service