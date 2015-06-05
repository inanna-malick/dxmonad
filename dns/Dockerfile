FROM pkinsky/dev
# dockerizing https://blog.amartynov.ru/archives/dnsmasq-docker-service-discovery/
# via hackery from http://pfigue.github.io/blog/2013/12/06/configuring-dnsmasq-to-serve-my-own-domain-name-zone/

RUN apt-get -y update
RUN apt-get -y install dnsmasq
RUN rm /etc/dnsmasq.conf
ADD docker-dns /etc/dnsmasq.conf
ADD docker-container-hosts /docker-container-hosts

RUN apt-get install -y daemontools


RUN mkdir -p /etc/daemons/dnsmasq /etc/daemons/watcher \
             /var/run/dnsmasq /var/run/watcher

RUN echo "#!/bin/bash\nexec /usr/sbin/dnsmasq" > /etc/daemons/dnsmasq/run
RUN chmod +x /etc/daemons/dnsmasq/run


ADD watcher /usr/sbin/watcher

RUN echo "#!/bin/bash\nexec /usr/sbin/watcher" > /etc/daemons/watcher/run
RUN chmod +x /etc/daemons/watcher/run

# todo: this: http://stage1.io/blog/running-services-in-a-docker-container-with-daemon-tools/
# solves the services problem, and the dead-simple approach 
# will let me run 1 dnsmasq (via nice simple cmd flags) and the event-watcher service
# both are dead simple, so this should actually work. also, the docker socket is unix,
# not tcp, so it's passed along with the rest of the volumes.
# this really works!

# I just need to: get the docker-spotter compiled

ENTRYPOINT ["/usr/bin/svscan", "/etc/daemons/"]
