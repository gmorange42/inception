#!/bin/sh

if [ -f /var/www/wordpress/wp-config.php ]
then
	echo "wp-config.php exist"
else
	wp core download --allow-root --path=/var/www/wordpress
	wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306 --path=/var/www/wordpress

	wp core install --allow-root --url=$DOMAINE_NAME --title=site_test --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --locale=fr_FR --skip-email --path=/var/www/wordpress

	wp user create --allow-root $USER_LOGIN $USER_EMAIL --user_pass=$USER_PASS --role=editor --path=/var/www/wordpress
	chown -R www-data:www-data /var/www/wordpress

fi

mkdir /run/php

exec "$@"
