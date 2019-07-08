#!/usr/bin/env bash

/usr/bin/pacman -Sy --noconfirm mariadb mariadb-clients libmariadbclient expect
sync

sed '/\[mariadb\]/a collation-server = utf8_unicode_ci\
character-set-server = utf8\
skip_name_resolve\
innodb_file_per_table\
max_connections = 1024\
performance_schema = off\
innodb_buffer_pool_size = 128M\
innodb_log_file_size = 64M\
innodb_flush_method = O_DIRECT_NO_FSYNC\
innodb_flush_log_at_trx_commit = 2\
thread_cache_size = 4\
bind-address = 0.0.0.0' -i /etc/my.cnf.d/server.cnf
sed "s/sql_mode=/sql_mode=NO_ENGINE_SUBSTITUTION #/" -i /etc/my.cnf.d/server.cnf
sync

/usr/bin/mysql_install_db --user="mysql" --basedir=/usr --datadir=/var/lib/mysql
sync

/usr/bin/systemctl enable mysqld.service
/usr/bin/systemctl start mysqld.service
sync

expect < /tmp/mariadb.exp
sync

mysql --user="root" --password="vagrant" -e "GRANT ALL ON *.* TO root@'0.0.0.0' IDENTIFIED BY 'vagrant' WITH GRANT OPTION;"
/usr/bin/mysqladmin shutdown --user="root" --password="vagrant"
sync

/usr/bin/pacman -Rns --noconfirm expect

/usr/bin/systemctl start mysqld.service

mysql --user="root" --password="vagrant" -e "CREATE USER 'vagrant'@'0.0.0.0' IDENTIFIED BY 'vagrant';"
mysql --user="root" --password="vagrant" -e "GRANT ALL ON *.* TO 'vagrant'@'0.0.0.0' IDENTIFIED BY 'vagrant' WITH GRANT OPTION;"
mysql --user="root" --password="vagrant" -e "GRANT ALL ON *.* TO 'vagrant'@'%' IDENTIFIED BY 'vagrant' WITH GRANT OPTION;"
mysql --user="root" --password="vagrant" -e "FLUSH PRIVILEGES;"

MYSQL_TZINFO=$(/usr/bin/mysql_tzinfo_to_sql /usr/share/zoneinfo | /usr/bin/mysql --user="root" --password="vagrant" mysql)
echo "$MYSQL_TZINFO"
