#!/usr/bin/env bash

cat >> /etc/pacman.conf <<EOF
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/\$arch
EOF
pacman -Sy --noconfirm yaourt

