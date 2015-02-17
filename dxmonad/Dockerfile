FROM ubuntu:14.04

#apt-get absolutely everything
RUN apt-get -y install software-properties-common
RUN sudo apt-add-repository ppa:synapse-core/testing
RUN apt-get update
RUN apt-get -y install \
      wget git curl xmonad libghc-xmonad-dev libghc-xmonad-contrib-dev \
      xmobar xcompmgr nitrogen stalonetray moreutils consolekit synapse \
      ssh-askpass-gnome thunar terminator remmina firefox \
      xz-utils file locales dbus-x11 pulseaudio dmz-cursor-theme \
      fonts-dejavu fonts-liberation hicolor-icon-theme \
      libcanberra-gtk3-0 libcanberra-gtk-module libcanberra-gtk3-module \
      libasound2 libgtk2.0-0 libdbus-glib-1-2 libxt6 libexif12 \
      libgl1-mesa-glx libgl1-mesa-dri vim-gnome vim docker.io xclip \
      network-manager network-manager-gnome xterm

# set up user
RUN adduser dev
RUN echo dev:dev | chpasswd
RUN adduser dev sudo
RUN mkdir -p /home/dev/bin
WORKDIR /home/dev
ENV HOME /home/dev


#install spf-13 (running after user setup)
RUN curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh


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
ADD dotfiles/bash_profile /home/dev/.bash_profile
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
