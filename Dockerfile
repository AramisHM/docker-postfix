FROM emarcs/debian-minit

MAINTAINER Marco Pompili <marcs.pompili@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q -q && \
    apt-get -q -y install apt-utils && \
    apt-get -q -y install rsyslog postfix

COPY ./syslog-ng.conf /etc/syslog-ng/

COPY main.cf /etc/postfix/
COPY master.cf /etc/postfix/

EXPOSE 25/tcp 465/tcp 587/tcp

VOLUME ["/var/spool/postfix"]

COPY ./startup /etc/minit/
