#!/bin/bash



docker run -d \
    --env DISPLAY=${DISPLAY} \
    --volume=/tmp/.X11-unix:/tmp/.X11-unix \
    --volume=/run/user/${USER_UID}/pulse:/run/pulse \
    pkinsky/xterm:latest
