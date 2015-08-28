#!/usr/bin/env bash

cat >> /etc/pacman.conf <<EOF

[kornrunner]
SigLevel = Never
Server = http://kornrunner.net/archlinux
EOF

/usr/bin/pacman -Sy --noconfirm kornrunner/mysql kornrunner/mysql-clients kornrunner/libmysqlclient