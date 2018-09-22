#!/usr/bin/env bash

IP_ADDRESS=$1
SITE_NAME=$2
DATABASE_NAME=$3
MYSQL_PASSWORD=$4

if [ $MYSQL_PASSWORD != 'password' ];
then
    echo "Updating MySQL root password..."
    mysql -uroot -ppassword -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_PASSWORD'); FLUSH PRIVILEGES;"
fi

echo "Creating database, if it doesn't already exist..."
mysql -uroot -p$MYSQL_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"

PHP_INFO_FILE="/var/www/public/info.php"
if [ ! -f "$PHP_INFO_FILE" ]
then
    echo "Creating phpinfo file..."
    echo '<?php echo phpinfo(); ?>' > /var/www/public/info.php
fi

echo "Setting nginx server_name..."
sudo sed -i -e "s/server_name _;/server_name $SITE_NAME;/g" /etc/nginx/sites-available/default

echo "Setting xdebug IP address in PHP ini..."
echo "xdebug.remote_host=$IP_ADDRESS" | sudo tee -a /etc/php/7.0/fpm/conf.d/user.ini

## Fixing errors in php-gettext
## Remove this once the Ubuntu package gets updated
echo "Fixing deprecation errors in php-gettext"
sudo sed -i 's/function StringReader/function __construct/g' /usr/share/php/php-gettext/streams.php
sudo sed -i "s/function FileReader/function __construct/g" /usr/share/php/php-gettext/streams.php
sudo sed -i "s/function CachedFileReader/function __construct/g" /usr/share/php/php-gettext/streams.php
sudo sed -i 's/function gettext_reader/function __construct/g' /usr/share/php/php-gettext/gettext.php

echo "Restarting web server..."
sudo systemctl restart php7.0-fpm
sudo systemctl restart nginx

echo "Setup complete."
