#!/bin/bash

function buildArchlinuxUser() {
  echo "Build Archlinux-user"
  docker build ./Archlinux-user -t draducanu/archlinux-user
  docker push draducanu/archlinux-user
}

function buildArchlinuxTools() {
  echo "Build Archlinux-tools"
  docker build ./Archlinux-tools -t draducanu/archlinux-tools
  docker push draducanu/archlinux-tools
}

function runIdea() {
  echo "Create 'Project' dir if not exist"
  mkdir -p ~/Projects

  echo "Create volume if not exist"
  docker volume create idea-config-vol
  docker volume create home-vol

  echo "Run tools"
  docker run -it --rm -e DISPLAY=:0 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v ~/Projects:/home/dragos/IdeaProjects \
    -v idea-config-vol:/home/dragos/.IntelliJIdea2019.2 \
    -v home-vol:/home \
    --net=host \
    draducanu/archlinux-tools
}

case $1 in
   "bau") buildArchlinuxUser;;
   "bat") buildArchlinuxTools;;
   "run") runIdea;;
   *) echo "Sorry, $1 not found";;
esac
