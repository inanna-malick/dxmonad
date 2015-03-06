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
RUN locale-gen en_US.UTF-8 && update-locale


ENV PATH /home/dev/bin:$PATH


# get spf13
# todo: put all the vim shit somewhere shared
RUN curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh


RUN apt-get -y install haskell-platform golang 

# go stuff
RUN mkdir -p /home/dev/go /home/dev/lib /home/dev/include
ENV PATH /home/dev/bin:$PATH
ENV PKG_CONFIG_PATH /home/dev/lib/pkgconfig
ENV LD_LIBRARY_PATH /home/dev/lib
ENV GOPATH /home/dev/go:$GOPATH
ENV PATH /home/dev/go/bin:$PATH

# install go utils 
RUN go get github.com/Soulou/curl-unix-socket 


RUN apt-get -y install postgresql vim-gnome

# get sbt
RUN curl -s https://raw.githubusercontent.com/paulp/sbt-extras/master/sbt > ~/bin/sbt \
  && chmod 0755 /home/dev/bin/sbt

#update cabal-install
RUN cabal update
RUN git clone git://github.com/haskell/cabal.git /home/dev/cabal-install && \
  cd /home/dev/cabal-install && \
  cabal install Cabal/ cabal-install/
ENV PATH /home/dev/.cabal/bin:$PATH

# used by spf13 haskell plugin
RUN cabal install ghc-mod
RUN ln -s /home/dev/.cabal/bin/ghc-mod /home/dev/.cabal/bin/ghcmod

RUN cabal install io-streams

RUN chown -R dev: /home/dev
