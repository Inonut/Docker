#!/bin/bash

mkdir -p ~/Projects

docker volume create tools-config

docker run -it --rm -e DISPLAY=:0 \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v ~/Projects:/home/dragos/IdeaProjects \
  -v tools-config:/home
  draducanu/archlinux-tools
