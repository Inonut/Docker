- give permission to .java/.userPrefs/jetbrains/prefs.xml into CMD command in /Idea/Dockerfile
- search where git cache user and pass to put it into volume
- improve Dockerfile:
    * put all in less commands
- make volumes for idea config
- make a bat for windows:
    * docker run --rm -it -e DISPLAY=192.168.131.24:0.0 -v d:/PROJECTS:/home/dragos/IdeaProjects -v d:/.config-vol/.Idea:/home/dragos/.IntelliJIdea2019.2 -v d:/.config-vol/.Idea.share:/home/dragos/.local/share/JetBrains -v d:/.config-vol/.Idea.pref:/home/dragos/.java/.userPrefs/jetbrains draducanu/idea
- new split:
    * archlinux-yay: only yay installed
    * archlinux-dev-tools: all tools that i need 
        ** idea
        ** git
        ** nodejs
        ** yarn
        ** python
        ** pip