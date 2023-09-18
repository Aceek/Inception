# Utilisation de l'image debian:buster comme base
FROM debian:buster

# Mise à jour des paquets et installation des dépendances nécessaires
RUN apt-get update \
    && apt-get install -y wget

# Récupération du binaire cAdvisor depuis le site officiel
RUN wget -O /usr/local/bin/cadvisor https://github.com/google/cadvisor/releases/download/v0.40.0/cadvisor

# Rendre le binaire cAdvisor exécutable
RUN chmod +x /usr/local/bin/cadvisor

# Exposer le port par défaut de cAdvisor
EXPOSE 8080

# Démarrage de cAdvisor lors du démarrage du conteneur
ENTRYPOINT ["/usr/local/bin/cadvisor", "-logtostderr"]
