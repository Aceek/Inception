# Utilisation de l'image debian:buster comme base
FROM debian:buster

# Mise à jour des paquets et installation des dépendances nécessaires
RUN apt-get update \
    && apt-get install -y php7.3-fpm php-mysqli wget

# Création du répertoire s'il n'existe pas
RUN mkdir -p /var/www/html

# Creation php et attribution des droits
RUN mkdir -p /run/php/ && chown www-data:www-data /run/php/

# Récupération du fichier adminer.php depuis le site officiel et le placer dans /var/www/html
RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O /var/www/html/adminer.php

# Modification des permissions pour que php-fpm puisse accéder au fichier
RUN chown www-data:www-data /var/www/html/adminer.php

# Copy conf file
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Ouverture du port 9000 pour php-fpm
EXPOSE 9000

# Démarrage de php-fpm en mode avant-plan lors du démarrage du conteneur
CMD ["php-fpm7.3", "-F"]