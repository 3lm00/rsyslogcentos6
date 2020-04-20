FROM centos:6.10
MAINTAINER Ewerton Lopes  <dockerelm@gmail.com>

RUN yum install rsyslog vim -y && yum clean all
EXPOSE 514/udp
WORKDIR /var/log/microtik
ADD ./rsyslog.conf /etc/rsyslog.conf
ADD ./Microtik /etc/logrotate.d/
CMD /etc/init.d/rsyslog start && /bin/bash
