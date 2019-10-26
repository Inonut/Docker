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

function buildArchlinuxGui() {
  echo "Build Archlinux-gui"
  docker build ./Archlinux-gui -t draducanu/archlinux-gui
  docker push draducanu/archlinux-gui
}

function runIdea() {
  echo "Create 'Project' dir if not exist"
  mkdir -p ~/Projects
  
  echo "Run tools"
  docker run -it --rm -e DISPLAY=:0 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v ~/Projects:/home/dragos/IdeaProjects \
    --net=host \
    draducanu/archlinux-tools
}

case $1 in
   "bulid")
      buildArchlinuxUser
      buildArchlinuxGui
      buildArchlinuxTools
      ;;
   "export") echo TODO export intellij settings from container;;
   *) runIdea;;
esac
