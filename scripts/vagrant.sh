#!/usr/bin/env bash

# Vagrant specific
date > /etc/vagrant_box_build_time

# Installing vagrant keys
mkdir -pm 700 /home/vagrant/.ssh
/usr/bin/curl -k --output /home/vagrant/.ssh/authorized_keys --location https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

# Set up oh-my-zsh
chsh -s $(which zsh) vagrant
cp /usr/share/oh-my-zsh/zshrc /home/vagrant/.zshrc
/usr/bin/sed -i 's/plugins=(git)/plugins=(git git-extras git-flow)/g' /home/vagrant/.zshrc
cat >> /home/vagrant/.zshrc <<EOF
autoload -U compinit promptinit
compinit
promptinit
EOF
chown -R vagrant /home/vagrant/.zshrc

# Composer
printf "\nexport PATH=\"/home/vagrant/.composer/vendor/bin:\$PATH\"\n" | tee -a /home/vagrant/.zshrc

# MySQL
mv /tmp/home/vagrant/.my.cnf /home/vagrant/.my.cnf
chown -R vagrant /home/vagrant/.my.cnf

# git
/usr/bin/runuser -l vagrant -c "git config --global alias.ci commit"
/usr/bin/runuser -l vagrant -c "git config --global alias.co checkout"
/usr/bin/runuser -l vagrant -c "git config --global alias.st status"
/usr/bin/runuser -l vagrant -c "git config --global alias.desc describe"
/usr/bin/runuser -l vagrant -c "git config --global alias.current-version 'describe --abbrev=0 --tags'"
/usr/bin/runuser -l vagrant -c "git config --global alias.lg \"log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit\""
/usr/bin/runuser -l vagrant -c "git config --global core.pager 'less -r'"

# Customize the message of the day
mv /tmp/etc/motd /etc/motd