#!/bin/bash

function buildAlpineTools() {
  docker build ./Alpine-tools -t draducanu/idea
  docker push draducanu/idea
}

function runIdea() {
  echo "Create 'Project' dir if not exist"
  mkdir -p ~/Projects
  
  echo "Run tools"
  docker run -it --rm -e DISPLAY=:0 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v ~/Projects:/home/developer/IdeaProjects \
    -v ~/.IntelliJIdea2019.2:/home/developer/.IntelliJIdea2019.2 \
    --net=host \
    draducanu/idea
}

case $1 in
   "build")
      buildAlpineTools
      ;;
   *) runIdea;;
esac

