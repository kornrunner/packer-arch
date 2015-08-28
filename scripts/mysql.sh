#!/usr/bin/env bash

/usr/bin/pacman -Sy --noconfirm kornrunner/mysql kornrunner/mysql-clients kornrunner/libmysqlclient
sync

sed 's/\[mysqld\]/[mysqld]\
collation-server = utf8_unicode_ci\
character-set-server = utf8\
character_set_client = utf8\
skip_name_resolve\
innodb_file_per_table\
max_connections = 1024\
performance_schema = off\
innodb_buffer_pool_size = 128M\
innodb_log_file_size = 64M\
innodb_flush_method = O_DIRECT_NO_FSYNC\
innodb_flush_log_at_trx_commit = 2\
thread_cache_size = 4\/' /etc/mysql/my.cnf
sync

/usr/bin/mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

/usr/bin/systemctl enable mysqld.service
sync

/usr/bin/pacman -Sy --noconfirm expect
sync

cat > /root/secure-mysql.sh <<EOF
#!/usr/bin/expect --

log_user 0
spawn /usr/bin/mysql_secure_installation

expect "Enter current password for root (enter for none): "
send "\\r"

expect "Set root password? \\\\\\[Y/n\\\\\\] "
send "Y\\r"

expect "New password: "
send "vagrant\\r"

expect "Re-enter new password: "
send "vagrant\\r"

expect "Remove anonymous users? \\\\\\[Y/n\\\\\\] "
send "Y\\r"

expect "Disallow root login remotely? \\\\\\[Y/n\\\\\\] "
send "Y\\r"

expect "Remove test database and access to it? \\\\\\[Y/n\\\\\\] "
send "Y\\r"

expect "Reload privilege tables now? \\\\\\[Y/n\\\\\\] "
send "Y\\r"

EOF
chmod +x /root/secure-mysql.sh
sync

# /usr/bin/mysqld_safe &
# /usr/bin/runuser -l root -c "/root/secure-mysql.sh"
 rm /root/secure-mysql.sh

# /usr/bin/mysqladmin shutdown --password=vagrant

/usr/bin/pacman -Rns --noconfirm expect

# /usr/bin/systemctl start mysqld.service

# /usr/bin/mysql_tzinfo_to_sql /usr/share/zoneinfo | /usr/bin/mysql --user=root --password=vagrant mysql