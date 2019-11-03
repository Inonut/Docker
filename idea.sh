#!/bin/bash

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
    -e GIT_USER=Inonut \
    -e GIT_TOKEN=$DOCKER_GIT_ACCESS_TOKEN \
    -e GIT_IDEA_SETTINGS=idea-settings \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v ~/Projects:/home/developer/IdeaProjects \
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

case $1 in
   "build")
      buildAlpineTools
      ;;
    "export") exportIdeaConfig;;
   *) runIdea;;
esac

