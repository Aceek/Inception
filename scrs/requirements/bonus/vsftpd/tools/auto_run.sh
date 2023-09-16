#!/bin/sh

# Créez le répertoire de travail pour WordPress s'il n'existe pas.
mkdir -p /var/www/html

# Creer le dossier vsftpdf pour pouvoir copier la config
mkdir -p /etc/vsftpd

# Creation du dossier empty pour l'option secure_chroot_dir
mkdir -p /var/run/vsftpd/empty
chown root:root /var/run/vsftpd/empty
chmod 755 /var/run/vsftpd/empty


# Copiez le fichier de configuration si c'est la première fois que le conteneur est démarré.
if [ ! -f "/etc/vsftpd/vsftpd.conf.bak" ]; then
    cp /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf
    cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak
fi

# Ajoutez l'utilisateur FTP, définissez son mot de passe et attribuez-lui la propriété du répertoire WordPress.
adduser $FTP_USR --disabled-password --gecos "" # --gecos "" évite de poser des questions pendant l'ajout de l'utilisateur.
echo "$FTP_USR:$FTP_PWD" | chpasswd
chown -R $FTP_USR:$FTP_USR /var/www/html

# Ajoutez l'utilisateur FTP à la liste des utilisateurs autorisés, s'il n'est pas déjà présent.
if ! grep -q "^$FTP_USR$" /etc/vsftpd.userlist; then
    echo $FTP_USR >> /etc/vsftpd.userlist
fi

# Démarrer le serveur vsftpd en foreground pour que le conteneur ne se termine pas.
echo "Démarrage du serveur FTP sur le port 21..."
exec /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
