#!/usr/bin/env bash

/usr/bin/pacman -S --noconfirm bind bind-tools
sync
/usr/bin/systemctl enable named.service