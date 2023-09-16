FROM debian:buster

RUN apt-get update -y && apt-get upgrade \
	&& apt-get install vsftpd -y

COPY conf/vsftpd.conf /tmp/vsftpd.conf

COPY tools/auto_run.sh /tmp/auto_run.sh

RUN chmod +x /tmp/auto_run.sh

ENTRYPOINT [ "sh", "/tmp/auto_run.sh" ]