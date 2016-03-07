FROM emarcs/debian-minit

MAINTAINER Marco Pompili <marcs.pompili@gmail.com>

RUN apt-get update -q -q && \
    apt-get -y install postfix

EXPOSE 25/tcp 465/tcp 587/tcp

VOLUME ["/var/log/postfix", "/var/spool/postfix"]

RUN ln -sf /dev/stdout /var/log/mail.log \
	&& ln -sf /dev/stderr /var/log/mail.err

COPY ./startup /etc/minit/
