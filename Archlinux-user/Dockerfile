FROM archlinux/base

ARG DOCKER_USER=dragos

# update
RUN pacman -Sy \
    && pacman --noconfirm -S sudo \
# clear cache
    && pacman --noconfirm -Scc \
# add user
    && useradd -m -G wheel -s /bin/bash $DOCKER_USER \
	&& passwd -d $DOCKER_USER \
	&& echo "$DOCKER_USER ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$DOCKER_USER \
	&& chown -R $DOCKER_USER /home/$DOCKER_USER

# change user
USER $DOCKER_USER

# change dir to user dir
WORKDIR /home/$DOCKER_USER