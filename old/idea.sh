#!/bin/bash

GIT_IDEA_SETTINGS=idea-settings
GIT_USER=Inonut
GIT_TOKEN=$DOCKER_GIT_ACCESS_TOKEN

function buildAlpineTools() {
  docker build ./Alpine-tools -t draducanu/idea
  docker push draducanu/idea
}

function buildArchTools() {
  docker build ./Archlinux-tools -t draducanu/idea
  docker push draducanu/idea
}

function runIdea() {
  echo "Create 'Project' dir if not exist"
  mkdir -p ~/Projects

  docker volume create idea-settings

  echo "Run tools - $(docker ps -a | grep draducanu/idea)"
  docker run -it --rm --privileged \
    -e DISPLAY=:0 \
    -e GIT_USER=$GIT_USER \
    -e GIT_TOKEN=$GIT_TOKEN \
    -e GIT_IDEA_SETTINGS=$GIT_IDEA_SETTINGS \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v ~/Projects:/home/developer/IdeaProjects \
    -v ~/Projects/idea-settings:/home/developer/.IntelliJIdea2019.2 \
    --name idea \
    draducanu/idea
}

function runWin() {
  echo "Create 'Project' dir if not exist"
  mkdir -p ~/Projects

  echo "Run tools - $(docker ps -a | grep draducanu/idea)"
  if [ ! "$(docker ps -a | grep draducanu/idea)" ]; then
    docker run -it -d --privileged \
    -e DISPLAY=$(ip route get 1 | awk '{print $NF;exit}'):0.0 \
    -e GIT_USER=$GIT_USER \
    -e GIT_TOKEN=$GIT_TOKEN \
    -e GIT_IDEA_SETTINGS=$GIT_IDEA_SETTINGS \
    -v d:/PROJECTS:/home/developer/Projects \
    draducanu/idea

    docker cp d:/PROJECTS idea:/home/developer/IdeaProjects
  else
    docker start idea
  fi
}

case $1 in
    "buildArch") buildArchTools;;
    "buildAlpine") buildAlpineTools;;
    "win") runWin;;
    "reset") docker rm -f idea;;
    *) runIdea;;
esac