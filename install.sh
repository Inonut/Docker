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
          - /tmp/.X11-unix:/tmp/.X11-unix
          - ~/IdeaProjects:/home/developer/IdeaProjects

EOF

# add terminal commad
sed -i '/alias idea/d' ~/.bashrc
echo "alias idea=\"ansible-playbook ~/.ansible/idea/idea.yml\"" >> ~/.bashrc