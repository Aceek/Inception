FROM debian:buster

# Mise à jour et installation des paquets
RUN apt-get update && apt-get install -y nginx vim openssl \
    && mkdir -p /etc/nginx/ssl \
    && openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=ilinhard.42.fr/UID=ilinhard" \
    && mkdir -p /var/run/nginx \
    && mkdir -p /var/www/html \
	&& chmod 755 /var/www/html \
    && chown -R www-data:www-data /var/www/html

# Copie de la configuration Nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

# Commande pour démarrer Nginx en mode démon
CMD [ "nginx", "-g", "daemon off;" ]
