#!/bin/bash

function buildArchlinuxChrome() {
  echo "Build Archlinux-chrome"
  docker build ./Archlinux-chrome -t draducanu/archlinux-chrome
#  docker push draducanu/archlinux-chrome
}

function runChrome() {
  echo "Run chrome"
  docker run -it --rm -e DISPLAY=:0 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /dev/snd:/dev/snd \
    --privileged \
    draducanu/archlinux-chrome
}

case $1 in
   "build")
      buildArchlinuxChrome
      ;;
   *) runChrome;;
esac
