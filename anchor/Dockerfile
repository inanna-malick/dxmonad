FROM ubuntu:14.04

RUN apt-get -y install openssh-client

#from docker0, may not be static
#ENTRYPOINT ["/usr/bin/ssh pkinsky@172.17.42.1"]

RUN mkdir .ssh
RUN ssh-keygen -f .ssh/id_rsa -t rsa -N ''

ADD start /start
RUN chmod 755 /start
ENTRYPOINT ["/start"]
