# Ganlancat's Random Scripts

## install_teleirc.sh

Install TeleIRC, a bridge between IRC and Telegram as a systemd service and set it up.

`bash <(curl -sSfL https://raw.githubusercontent.com/hatateaya/scripts/refs/heads/main/install_teleirc.sh)`

## mkluksedsqfs.sh

Make an LUKS2 encrypted SquashFS image file from the directory you provide. 

You can set suffix of the image file as `.iso` then you can simply double-click it in GNOME's nautilus or KDE's dolphin then mount it after entered your passphrase.

`bash <(curl -sSfL https://raw.githubusercontent.com/hatateaya/scripts/refs/heads/main/make_luks_squashfs.sh)`

## local.conf

This is a `/etc/systemd/logind.conf.d/local.conf` file that disables automatic suspend when lid is closed and when system is idle.

`sudo wget https://raw.githubusercontent.com/hatateaya/scripts/refs/heads/main/local.conf -O /etc/systemd/logind.conf.d/local.conf && sudo systemctl restart systemd-logind.service`

## fonts.conf

This is a `~/.config/fontconfig/fonts.conf` file that specifies `Noto Sans CJK TC` as the fallback of `Cantarell` or `Liberation Serif` or `Noto Sans Mono` fonts.

`mkdir -pv ~/.config/fontconfig/ && wget https://raw.githubusercontent.com/hatateaya/scripts/refs/heads/main/fonts.conf -O ~/.config/fontconfig/fonts.conf && fc-cache -fv`

To get it works for Flatpak applications, do:

`flatpak override --user --filesystem=xdg-config/fontconfig:ro`

## video_compress.sh

Using system's FFmpeg CLI tools with VAAPI graphic card accelerating API to compress your video to 854*480 400k H.264 and audio to 44.1 kHz Stereo MPEG-4 AAC and packed in an `.mp4`.

You need to install FULL FFmpeg tools and VAAPI utilities before using that. e.g, For non-ostree Fedora:

```
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf update
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf install libva-utils
sudo dnf install intel-media-driver # For Intel GPUs
sudo dnf install mesa-va-drivers-freeworld # For AMD GPUs
sudo usermod -aG video,render $USER
```

After that, you need reboot. Then, you can use this like:

`bash <(curl -sSfL https://raw.githubusercontent.com/hatateaya/scripts/refs/heads/main/video_compress.sh) /path/to/your/video.mp4`