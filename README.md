# packer-arch
Packer.io template for `Arch Linux` (x86_64). Used to build [kornrunner/arch](https://atlas.hashicorp.com/kornrunner/boxes/arch)

Base box for vagrant based on `archlinux-2015.08.01-dual.iso` intended for PHP development.
Provisioned stuff:

- scripts/vcs.sh: `git`, `gitflow-git`, `subversion`
- scripts/nginx.sh: `nginx` + enable service
- scripts/memcached.sh: `memcached` + enable service
- scripts/redis.sh: `redis` + enable service
- scripts/mongo.sh: `mongodb`, `mongodb-tools` + enable service
- scripts/supervisord.sh: `supervisord`
- scripts/nodejs.sh: `nodejs`, `npm`, `nodejs-bower`, `nodejs-gulp`
- scripts/php.sh: `php`, `php-apcu`, `php-fpm`, `php-gd`, `php-imap`, `php-mcrypt`, `php-tidy`, `php-memcached`, `php-redis`, `php-mongo`, `php-phalcon`, `php-uopz-git`, `composer` + enable `php-fpm` service, enable extensions
- scripts/mysql.sh: installs `mysql`, `mysql-clients`, `libmysqlclient`
- scripts/mailcatcher.sh: `ruby-mailcatcher`
- scripts/phantomjs.sh: `phantomjs`
- scripts/named.sh: `bind`, `bind-tools` + enable `named` service
- scripts/tools.sh: `htop`, `ack`, `reptyr`, `colordiff`, `mc`, `pv`, `screen`, `gawk`
- scripts/zsh.sh: installs `zsh`, `oh-my-zsh`
- scripts/vagrant.sh: creates `vagrant` user, adds Vagrant key, changes shell to `zsh` + `oh-my-zsh`
- scripts/stat.sh: `lsof`, `iotop`, `libstatgrab`
- scripts/pacman.sh: adds custom `kornrunner` repo (required for mysql and php-uopz-git), uses `reflector` to sort mirrorlist
- scripts/yaourt.sh: adds `archlinuxfr` repo and installs `yaourt` (AUR)

Machine:
- 2 CPU
- 20GB HDD (single partition `ext4` `/`)

Users:
- `vagrant`/`vagrant`
- `root`/`vagrant`
