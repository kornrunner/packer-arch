# packer-arch
Packer.io template for `Arch Linux` (x86_64). Used to build [kornrunner/arch](https://atlas.hashicorp.com/kornrunner/boxes/arch)

Base box for vagrant based on `archlinux-2015.08.01-dual.iso` intended for PHP development.

Shell and MySQL users:
- `vagrant`/`vagrant`
- `root`/`vagrant`

Provisioned stuff:
- scripts/vcs.sh: `git`, `git-up`, `gitflow-avh`, `subversion`
- scripts/nginx.sh: `nginx` + enable service
- scripts/memcached.sh: `memcached` + enable service
- scripts/redis.sh: `redis` + enable service
- scripts/mongo.sh: `mongodb` + enable service
- scripts/supervisord.sh: `supervisord`
- scripts/nodejs.sh: `nodejs`, `npm`, `bower`, `gulp`, `browserify`
- scripts/php.sh: `php`, `php-apcu`, `php-apcu-bc`, `php-fpm`, `php-gd`, `php-imap`, `php-mcrypt`, `php-tidy`, `php-memcached`, `php-phalcon`, `composer` + enable `php-fpm` service, enable extensions
- scripts/mysql.sh: installs `mariadb`, `mariadb-clients`, `libmariadbclient`
- scripts/phantomjs.sh: `phantomjs`
- scripts/rabbitmq.sh: `rabbitmq`
- scripts/named.sh: `bind`, `bind-tools` + enable `named` service
- scripts/asd.sh: `anything-sync-daemon`
- scripts/tools.sh: `htop`, `ack`, `reptyr`, `colordiff`, `mc`, `pv`, `screen`, `gawk`
- scripts/zsh.sh: installs `zsh`, `oh-my-zsh`
- scripts/vagrant.sh: creates `vagrant` user, adds Vagrant key, changes shell to `zsh` + `oh-my-zsh`
- scripts/stat.sh: `lsof`, `iotop`, `libstatgrab`
- scripts/pacman.sh: adds uses `reflector` to sort mirrorlist
- scripts/yay.sh: installs `yay` (AUR)

PHP Modules
```
[PHP Modules]

apc
apcu
Core
ctype
curl
date
dom
ereg
fileinfo
filter
gd
gettext
hash
iconv
imap
json
libxml
mbstring
mcrypt
memcached
mhash
mongo
mysqli
mysqlnd
openssl
pcntl
pcre
PDO
pdo_mysql
phalcon
Phar
readline
redis
Reflection
session
SimpleXML
soap
SPL
standard
tidy
tokenizer
uopz
xml
xmlreader
xmlwriter
Zend OPcache
zip
zlib

[Zend Modules]
Zend OPcache
uopz
```

Machine:
- 2 CPU
- 20GB HDD (single partition `ext4` `/`)
