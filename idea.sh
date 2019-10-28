#!/bin/bash

function buildArchlinuxTools() {
  echo "Build Archlinux-tools"
  docker build ./Archlinux-tools -t draducanu/archlinux-tools
  docker push draducanu/archlinux-tools
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

function exportIdeaConfig() {
  root=~/IdeaProjects/Docker/Archlinux-tools/
  cp -fr ~/.IntelliJIdea2019.2/ "$root"

  eval=$(find "$root" -iname eval 2>/dev/null | grep -e \..*/config/eval)
  rm -fr "$eval"

  statistics=$(find "$root" -iname *statistics* 2>/dev/null | grep -e \..*/config/.*\.xml)
  rm -fr "$statistics"

  option=$(find "$root" -iname 'other.xml' 2>/dev/null | grep -e \..*/config/options/other\.xml)
  sed -i.bak '/evlsprt*/d' "$option"
}

case $1 in
   "build")
      buildArchlinuxTools
      ;;
   "export") exportIdeaConfig;;
   *) runIdea;;
esac
