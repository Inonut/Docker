#!/bin/bash

GIT_IDEA_SETTINGS=idea-settings
GIT_USER=Inonut
GIT_TOKEN=$DOCKER_GIT_ACCESS_TOKEN

function buildAlpineTools() {
  docker build ./Alpine-tools -t draducanu/idea
  docker push draducanu/idea
}

function runIdea() {
  echo "Create 'Project' dir if not exist"
  mkdir -p ~/Projects
  
  echo "Run tools"
  docker run -it --rm --privileged \
    -e DISPLAY=:0 \
    -e GIT_USER=$GIT_USER \
    -e GIT_TOKEN=$GIT_TOKEN \
    -e GIT_IDEA_SETTINGS=$GIT_IDEA_SETTINGS \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v ~/Projects:/home/developer/IdeaProjects \
    draducanu/idea
}

function runWin() {
  echo "Create 'Project' dir if not exist"
  mkdir -p ~/Projects

  echo "Run tools"
  docker run -it --rm --privileged \
    -e DISPLAY=$(ip route get 1 | awk '{print $NF;exit}'):0.0 \
    -e GIT_USER=$GIT_USER \
    -e GIT_TOKEN=$GIT_TOKEN \
    -e GIT_IDEA_SETTINGS=$GIT_IDEA_SETTINGS \
    -v d:/PROJECTS:/home/developer/IdeaProjects \
    draducanu/idea
}

function exportIdeaConfig() {
  root=~/IdeaProjects/Docker/Alpine-tools/.IntelliJIdea2019.2
  mkdir -p "$root"
  cp -fr ~/.IntelliJIdea2019.2/config "$root"/config

  eval=$(find "$root" -iname eval 2>/dev/null | grep -e \..*/config/eval)
  rm -fr "$eval"

  statistics=$(find "$root" -iname *statistics* 2>/dev/null | grep -e \..*/config/.*\.xml)
  rm -fr "$statistics"

  option=$(find "$root" -iname 'other.xml' 2>/dev/null | grep -e \..*/config/options/other\.xml)
  sed -i.bak '/evlsprt*/d' "$option"
}

CURRENT_PATH=$(pwd)
cd Alpine-tools
if [ ! -d "$GIT_IDEA_SETTINGS" ]; then
  git clone https://$GIT_TOKEN@github.com/$GIT_USER/$GIT_IDEA_SETTINGS.git
else
  cd $GIT_IDEA_SETTINGS
  git pull
fi
cd $CURRENT_PATH

case $1 in
    "build") buildAlpineTools;;
    "export") exportIdeaConfig;;
    "win") runWin;;
    *) runIdea;;
esac
