FROM pkinsky/dev

# Create a shared data volume
# We need to create an empty file, otherwise the volume will
# belong to root.
# This is probably a Docker bug.
RUN mkdir /maersk/
RUN touch /maersk/placeholder
VOLUME /maersk

RUN chown dev /maersk
