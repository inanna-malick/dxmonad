FROM pkinsky/dev

RUN apt-get -y install firefox xz-utils file locales dbus-x11 \
      pulseaudio dmz-cursor-theme fonts-dejavu fonts-liberation \
      hicolor-icon-theme libcanberra-gtk3-0 libcanberra-gtk-module \
      libcanberra-gtk3-module libasound2 libgtk2.0-0 libdbus-glib-1-2 \
      libxt6 libexif12 libgl1-mesa-glx libgl1-mesa-dri vim-gnome \
      xterm

#install xmonad utils
RUN apt-get -y install xmonad libghc-xmonad-dev libghc-xmonad-contrib-dev \
      xmobar xcompmgr nitrogen stalonetray moreutils consolekit dmenu \
      ssh-askpass-gnome thunar terminator remmina network-manager \
      network-manager-gnome xterm haskell-platform


ENV PULSE_SERVER /run/pulse/native


#add a bunch of dotfiles
ADD dotfiles/bashrc /home/dev/.bashrc
ADD dotfiles/gitconfig /home/dev/.gitconfig
ADD dotfiles/Xresources /home/dev/.Xresources
ADD bin /home/dev/bin

ADD xmonad /home/dev/.xmonad
RUN chmod 777 /home/dev/.xmonad/xmonad.hs
# ensure xmonad.hs can compile
RUN xmonad --recompile

#grant ownership of /home/dev to dev. run after all modifications to same
RUN chown -R dev: /home/dev

#add start script entrypoint
ADD start /start
RUN chmod 755 /start

RUN apt-get -y install mysql-client

USER dev
CMD ["/start"]
