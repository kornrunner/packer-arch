#!/usr/bin/env bash

/usr/bin/pacman -S --noconfirm nginx
sync
/usr/bin/systemctl enable nginx.service