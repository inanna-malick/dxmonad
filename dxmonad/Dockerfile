FROM ubuntu:14.04

#apt-get absolutely everything
RUN apt-get -y install software-properties-common
RUN sudo apt-add-repository ppa:synapse-core/testing
RUN apt-get update

# install base
RUN apt-get -y install \
      wget git curl  firefox xz-utils file locales dbus-x11 \
      pulseaudio dmz-cursor-theme fonts-dejavu fonts-liberation \
      hicolor-icon-theme libcanberra-gtk3-0 libcanberra-gtk-module \
      libcanberra-gtk3-module libasound2 libgtk2.0-0 libdbus-glib-1-2 \
      libxt6 libexif12 libgl1-mesa-glx libgl1-mesa-dri vim-gnome vim \
      docker.io xclip xterm

#install xmonad utils
RUN apt-get -y install xmonad libghc-xmonad-dev libghc-xmonad-contrib-dev \
      xmobar xcompmgr nitrogen stalonetray moreutils consolekit dmenu \
      ssh-askpass-gnome thunar terminator remmina network-manager \
      network-manager-gnome xterm

# set up user
RUN adduser dev
RUN echo dev:dev | chpasswd
RUN adduser dev sudo
RUN mkdir -p /home/dev/bin
WORKDIR /home/dev
ENV HOME /home/dev


# now for the non-package-manager install block

# get spf13
RUN curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh


# get cabal
RUN apt-get -y install haskell-platform
#RUN wget https://www.haskell/release/cabal-install-1.22.0.0/cabal-instal.tar.gz && \
#    tar -zxf cabal-install-1.22.0.0.tar.gz && \
#    cd cd cabal-install-1.22.0 && \
#    sh bootstrap.shared

# Create a shared data volume
# We need to create an empty file, otherwise the volume will
# belong to root.
# This is probably a Docker bug.
RUN mkdir /var/shared/
RUN touch /var/shared/placeholder
RUN chown -R dev:dev /var/shared
VOLUME /var/shared


#add env vars
# ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV PATH /home/dev/bin:$PATH
ENV PULSE_SERVER /run/pulse/native


#add a bunch of dotfiles
ADD dotfiles/bashrc /home/dev/.bashrc
ADD dotfiles/gitconfig /home/dev/.gitconfig
ADD dotfiles/Xresources /home/dev/.Xresources
ADD xmonad /home/dev/.xmonad
RUN chmod 777 /home/dev/.xmonad/xmonad.hs

#grant ownership of /home/dev to dev. run after all modifications to same
RUN chown -R dev: /home/dev

#add start script entrypoint
ADD start /start
RUN chmod 755 /start


USER dev
ENTRYPOINT ["/start"]
