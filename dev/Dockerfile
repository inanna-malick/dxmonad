FROM dockerfile/java:oracle-java7

#apt-get absolutely everything
RUN apt-get -y install software-properties-common
RUN sudo apt-add-repository ppa:synapse-core/testing
RUN apt-get update

# install base
RUN apt-get -y install vim wget git curl docker.io xclip

# set up user
RUN adduser dev
RUN echo dev:dev | chpasswd
RUN adduser dev sudo
RUN mkdir -p /home/dev/bin
WORKDIR /home/dev
ENV HOME /home/dev

#ENV vars
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV PATH /home/dev/bin:$PATH


# get spf13
# todo: put all the vim shit somewhere shared
RUN curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh

RUN chown -R dev: /home/dev
