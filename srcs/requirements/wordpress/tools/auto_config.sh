sleep 10
wp config create \
	--allow-root \
	--dbname=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PASSWORD \
	--dbhost=mariadb:3306 --path='/var/www/wordpress'

wp core install \
	--url=$WP_URL \
	--title=$WP_TITLE \
	--admin_user=$WP_ADMIN_USR \
	--admin_password=$WP_ADMIN_PWD \
	--admin_email=$WP_ADMIN_EMAIL

wp user create $WP_USR $WP_EMAIL --user_pass=$WP_PWD --role=author --allow-root

mkdir /run/php

/usr/sbin/php-fpm7.3 -F