# Ganlancat's Random Scripts

## install_teleirc.sh

Install TeleIRC, a bridge between IRC and Telegram as a systemd service and set it up, enabling it and start it immediately.

`wget https://raw.githubusercontent.com/hatateaya/scripts/refs/heads/main/install_teleirc.sh -O install_teleirc.sh && chmod +x install_teleirc.sh && ./install_teleirc.sh && rm install_teleirc.sh`

## mkluksedsqfs.sh

Make an LUKS2 encrypted SquashFS image file from the directory you provide. You can set suffix of the image file as iso then you can click it to input passphase and mount it in most Linux desktop environments.

`wget https://raw.githubusercontent.com/hatateaya/scripts/refs/heads/main/mkluksedsqfs.sh -O mkluksedsqfs.sh && chmod +x mkluksedsqfs.sh && ./mkluksedsqfs.sh && rm mkluksedsqfs.sh`

## local.conf

This is a /etc/systemd/logind.conf.d/local.conf file that disables automatic suspend when lid is closed and when system is idle.

`sudo wget https://raw.githubusercontent.com/hatateaya/scripts/refs/heads/main/local.conf -O /etc/systemd/logind.conf.d/local.conf && sudo systemctl restart systemd-logind.service`

## .fonts.conf

This is a ~/.fonts.conf file that specifies Noto Sans CJK SC as the fallback of Times New Roman / Cantarell / Monospace font.

`wget https://raw.githubusercontent.com/hatateaya/scripts/refs/heads/main/.fonts.conf -O ~/.fonts.conf`

To get it works for all flatpak applications, use:

`flatpak override --user --filesystem=~/.fonts.conf:ro`

Advertising texts:

使用桌面 GNU/Linux 发行版时遇见字体变成这个疑惑样子时该怎么办呢？

答案是使用 橄榄菜™ 字体配置文件！

`wget https://raw.githubusercontent.com/hatateaya/scripts/refs/heads/main/.fonts.conf -O ~/.fonts.conf&&
flatpak override --user --filesystem=~/.fonts.conf:ro`

（注销重进后）一行命令让您的桌面 GNU/Linux 发行版中文显示重回美观！
