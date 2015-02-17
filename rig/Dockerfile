# JVM/Scala/SBT development environment
# will eventually run with links to xyz containers for various services
FROM pkinsky/dev


RUN curl -s https://raw.githubusercontent.com/paulp/sbt-extras/master/sbt > ~/bin/sbt \
  && chmod 0755 ~/bin/sbt

$ todo: add -sbt-dir /maersk/.sbt/plugins
RUN echo "alias sbt='sbt -sbt-boot /maersk/.sbt/boot -ivy /maersk/.ivy2'" >> /home/dev/.bashrc

RUN mkdir test && cd test && touch build.sbt && sbt compile && cd .. && rm -r test
