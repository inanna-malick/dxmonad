FROM ubuntu:14.04
ADD resources /resources
ADD bin /resources/bin
ADD start /start
RUN chmod 755 /start
ENTRYPOINT ["/start"]
