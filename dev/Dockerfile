FROM ubuntu:14.04

RUN apt-get update
RUN apt-get -y install xterm

ADD start /start
RUN chmod 755 start

RUN adduser xterm
USER xterm

ENTRYPOINT ["/start"]
