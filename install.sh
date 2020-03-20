#!/bin/bash
##### Scipt to install idea on docker in arch linux distro ######
# asume that you already have docker installed

# install ansible if not present
pacman --noconfirm -Sy ansible python python-pip
pip install docker

# add idea yml playbook
rm -fr ~/.ansible/idea
mkdir -p ~/.ansible/idea

cat <<EOF > ~/.ansible/idea/idea.yml
---
- name: intellij idea
  hosts: localhost
  vars:
    idea_image: "draducanu/arch-idea"
    idea_container: "idea-container"
    path: "~/.IntelliJIdea"
  tasks:
    - name: open idea
      docker_container:
        name: "{{idea_container}}"
        image: "{{idea_image}}"
        pull: true
        network_mode: host
        env:
          DISPLAY: ":0"
        volumes:
          - "/tmp/.X11-unix:/tmp/.X11-unix"
          - "~/Projects:/root/IdeaProjects"
          - "{{path}}:/root/.IntelliJIdea2019.3"
          - "{{path}}/.local/share/JetBrains:/root/.local/share/JetBrains"
          - "{{path}}/.java/.userPrefs/jetbrains:/root/.java/.userPrefs/jetbrains"
          - "{{path}}/libs:/root/libs"
          - "{{path}}/.m2:/root/.m2"
          - "{{path}}/.gradle:/root/.gradle"

EOF

# add terminal commad
sed -i '/alias idea=/d' ~/.bashrc
echo "alias idea=\"ansible-playbook ~/.ansible/idea/idea.yml\"" >> ~/.bashrc
