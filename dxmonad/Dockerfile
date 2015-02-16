FROM ubuntu:14.04

RUN apt-get -y install software-properties-common
RUN sudo apt-add-repository ppa:synapse-core/testing
RUN apt-get update
RUN apt-get -y install wget git curl xmonad libghc-xmonad-dev libghc-xmonad-contrib-dev xmobar xcompmgr nitrogen stalonetray moreutils consolekit synapse ssh-askpass-gnome thunar terminator remmina


RUN wget -q -O - "https://dl-ssl.google.com/linux/linux_signing_key.pub" | sudo apt-key add - \
 && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
 && apt-get update

RUN apt-get install -y xz-utils file locales dbus-x11 pulseaudio dmz-cursor-theme \
      fonts-dejavu fonts-liberation hicolor-icon-theme google-chrome-stable \
      libcanberra-gtk3-0 libcanberra-gtk-module libcanberra-gtk3-module \
      libasound2 libgtk2.0-0 libdbus-glib-1-2 libxt6 libexif12 \
      libgl1-mesa-glx libgl1-mesa-dri

ADD scripts /scripts

RUN adduser dev
RUN echo dev:dev | chpasswd
RUN adduser dev sudo
# RUN mkdir /home/dev && chown -R dev: /home/dev
RUN mkdir -p /home/dev/bin
ENV PATH /home/dev/bin:$PATH
ENV PULSE_SERVER /run/pulse/native
WORKDIR /home/dev
ENV HOME /home/dev



# Create a shared data volume
# We need to create an empty file, otherwise the volume will
# belong to root.
# This is probably a Docker bug.
RUN mkdir /var/shared/
RUN touch /var/shared/placeholder
RUN chown -R dev:dev /var/shared
VOLUME /var/shared

RUN apt-get -y install vim-gnome vim docker.io xclip xterm

#install spf-13
RUN curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh

#these are always last, because any change to the dotfiles requires rerunning all later steps
ADD dotfiles/bash_profile /home/dev/.bash_profile
ADD dotfiles/gitconfig /home/dev/.gitconfig
ADD dotfiles/Xresources /home/dev/.Xresources

ADD xmonad /home/dev/.xmonad
RUN chmod 777 /home/dev/.xmonad/xmonad.hs

RUN apt-get -y install network-manager network-manager-gnome

#grant ownership of /home/dev to dev. run after all modifications to same
RUN chown -R dev: /home/dev



ADD start /start
RUN chmod 755 /start

# ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

USER dev
ENTRYPOINT ["/start"]


