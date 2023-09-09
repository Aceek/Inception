FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y \
	&& apt-get -y install wget \
	&& apt-get -y install php7.3 php-fpm php-mysql \
	&& apt-get -y install mariadb-client \
	&& wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www \
	&& cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz \
	&& chown -R root:root /var/www/wordpress \
	&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

COPY conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY tools/auto_config.sh /tmp/auto_config.sh

ENTRYPOINT ["sh", "/tmp/auto_config.sh"]