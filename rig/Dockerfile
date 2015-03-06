# for running nitro platform and others
FROM pkinsky/dev

#add a bunch of dotfiles
ADD dotfiles/bashrc /home/dev/.bashrc
ADD dotfiles/gitconfig /home/dev/.gitconfig
ADD dotfiles/Xresources /home/dev/.Xresources

ADD bin /home/dev/bin
ENV PATH /home/dev/idea/bin:$PATH

RUN chown -R dev: /home/dev

USER dev
