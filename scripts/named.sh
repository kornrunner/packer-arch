#!/usr/bin/env bash

/usr/bin/pacman -S --noconfirm bind bind-tools
sync
/usr/bin/systemctl enable named.service

echo "nameserver 127.0.0.1" > /etc/resolv.conf.head