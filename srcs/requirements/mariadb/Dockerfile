FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade \
	&& apt-get -y install mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/mariadb_launch.sh /tmp/mariadb_launch.sh

ENTRYPOINT ["sh", "/tmp/mariadb_launch.sh"]