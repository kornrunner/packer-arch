#!/usr/bin/env bash

/usr/bin/runuser -l vagrant -c '/usr/bin/yay -S --noconfirm mongodb-bin'
sync
/usr/bin/systemctl enable mongodb.service
