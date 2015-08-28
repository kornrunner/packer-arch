#!/usr/bin/env bash

/usr/bin/pacman -S --noconfirm mongodb mongodb-tools
sync
/usr/bin/systemctl enable mongodb.service