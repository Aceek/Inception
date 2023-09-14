FROM debian:buster

# Mise à jour des paquets et installation de Redis
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y redis-server && \
    sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g"  /etc/redis/redis.conf && \
    sed -i "s|# maxmemory <bytes>|maxmemory 20mb|g"  /etc/redis/redis.conf && \
    echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Exposition du port 6379 pour Redis
EXPOSE 6379

# Commande pour exécuter Redis lors du démarrage du conteneur
CMD [ "redis-server", "/etc/redis/redis.conf" ]
