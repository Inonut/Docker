mkdir -p ~/Projects
mkdir -p ~/.config-vol/.Idea
mkdir -p ~/.config-vol/.Idea.share

docker run -it --rm \
  -e DISPLAY=:0 \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v ~/Projects:/home/dragos/IdeaProjects \
  -v ~/.config-vol/.Idea:/home/dragos/.IntelliJIdea2019.2
  -v ~/.config-vol/.Idea.share:/home/dragos/.local/share/JetBrains
  draducanu/idea