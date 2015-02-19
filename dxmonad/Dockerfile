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
      network-manager-gnome xterm haskell-platform mysql-client \
      rxvt-unicode notify-osd libnotify-bin golang

ENV PULSE_SERVER /run/pulse/native

#add start script entrypoint
ADD start /start
RUN chmod 755 /start



RUN cabal update

#positioned to minimize rebuilding
RUN git clone git://github.com/haskell/cabal.git /home/dev/cabal-install && \
  cd /home/dev/cabal-install && \
  cabal install Cabal/ cabal-install/

RUN cabal install ghc-mod
ENV PATH /home/dev/.cabal/bin:$PATH
RUN ln -s /home/dev/.cabal/bin/ghc-mod /home/dev/.cabal/bin/ghcmod

RUN cabal install io-streams


# go stuff
RUN mkdir -p /home/dev/go /home/dev/lib /home/dev/include
ENV PATH /home/dev/bin:$PATH
ENV PKG_CONFIG_PATH /home/dev/lib/pkgconfig
ENV LD_LIBRARY_PATH /home/dev/lib
ENV GOPATH /home/dev/go:$GOPATH
ENV PATH /home/dev/go/bin:$PATH

# install go utils
RUN go get github.com/Soulou/curl-unix-socket


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

USER dev
CMD ["/start"]
