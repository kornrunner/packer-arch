#!/usr/bin/env bash

fallocate -l 2G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile

/usr/bin/runuser -l vagrant -c '/usr/bin/yaourt -S --noconfirm php php-apcu php-apcu-bc php-fpm php-gd php-imap php-mcrypt php-tidy php-memcached php-pear php-phalcon php-uopz-git'
sync

/usr/bin/pecl channel-update pecl.php.net
/usr/bin/pecl install mongodb
/usr/bin/pecl install redis
/usr/bin/systemctl enable php-fpm.service

sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/php.ini
sed -i "s/display_errors = .*/display_errors = On/" /etc/php/php.ini
sed -i "s/display_startup_errors = .*/display_startup_errors = On/" /etc/php/php.ini
sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/php.ini
sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/php.ini
sed -i "s/open_basedir =/;open_basedir =/" /etc/php/php.ini

# Extensions
sed -i "s/;//" /etc/php/conf.d/apcu.ini
sed -i "s/;//" /etc/php/conf.d/memcached.ini
mv /tmp/etc/php/conf.d/*.ini /etc/php/conf.d/

curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

swapoff /swapfile
rm /swapfile