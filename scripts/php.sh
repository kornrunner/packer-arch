#!/usr/bin/env bash

/usr/bin/runuser -l vagrant -c '/usr/bin/yaourt -S --noconfirm php php-apcu php-fpm php-gd php-imap php-mcrypt php-tidy php-memcached php-redis'
sync
/usr/bin/systemctl enable php-fpm.service

sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/php.ini
sed -i "s/display_errors = .*/display_errors = On/" /etc/php/php.ini
sed -i "s/display_startup_errors = .*/display_startup_errors = On/" /etc/php/php.ini
sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/php.ini
sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/php.ini
sed -i "s/open_basedir =/;open_basedir =/" /etc/php/php.ini
echo -n 'extension=openssl.so' > /etc/php/conf.d/openssl.ini
echo -n 'extension=phar.so' > /etc/php/conf.d/phar.ini

curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer