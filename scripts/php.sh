#!/usr/bin/env bash

/usr/bin/runuser -l vagrant -c '/usr/bin/yaourt -S --noconfirm php php-apcu php-fpm php-gd php-imap php-mcrypt php-tidy php-memcached php-redis php-mongo php-phalcon php-uopz-git'
sync
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
sed -i "s/;//" /etc/php/conf.d/redis.ini
echo 'extension=openssl.so' > /etc/php/conf.d/openssl.ini
echo 'extension=phar.so' > /etc/php/conf.d/phar.ini
echo 'extension=gd.so' > /etc/php/conf.d/gd.ini
echo 'extension=iconv.so' > /etc/php/conf.d/iconv.ini
echo 'extension=imap.so' > /etc/php/conf.d/imap.ini
echo 'extension=mcrypt.so' > /etc/php/conf.d/mcrypt.ini
echo 'extension=mysqli.so' > /etc/php/conf.d/mysqli.ini
echo 'extension=zip.so' > /etc/php/conf.d/zip.ini
echo 'extension=soap.so' > /etc/php/conf.d/soap.ini
echo 'extension=phalcon.so' > /etc/php/conf.d/phalcon.ini
echo 'extension=tidy.so' > /etc/php/conf.d/tidy.ini
echo 'extension=pdo_mysql.so' > /etc/php/conf.d/pdo_mysql.ini
echo 'zend_extension=opcache.so' > /etc/php/conf.d/zend_opcache.ini
sed -i "s/;//" /etc/php/conf.d/uopz.ini

curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer