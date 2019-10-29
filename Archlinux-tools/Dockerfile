FROM archlinux/base

ARG DOCKER_USER=idea

COPY mirrorlist /etc/pacman.d/mirrorlist

# update
RUN pacman -Sy \
    && pacman --noconfirm -S sudo nano \
# add user
    && useradd -m -G wheel -s /bin/bash $DOCKER_USER \
	&& passwd -d $DOCKER_USER \
	&& echo "$DOCKER_USER ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$DOCKER_USER \
	&& chown -R $DOCKER_USER /home/$DOCKER_USER

# change user
USER $DOCKER_USER

# change dir to user dir
WORKDIR /home/$DOCKER_USER

RUN sudo pacman --noconfirm -S base-devel libxrender gtk3

RUN sudo pacman --noconfirm -S git

RUN git clone https://aur.archlinux.org/yay.git \
    && cd yay \
    && makepkg --noconfirm -si \
    && cd .. \
    && rm -fr yay

#RUN yay --noconfirm -S ttf-dejavu ttf-liberation noto-fonts \
#    && sudo ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d \
#    && sudo ln -s /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d \
#    && sudo ln -s /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d \
#    && echo 'export FREETYPE_PROPERTIES="truetype:interpreter-version=40"' | sudo tee -a /etc/profile.d/freetype2.sh \
#    && echo '<?xml version="1.0"?>' | sudo tee -a /etc/fonts/local.conf \
#    && echo '<!DOCTYPE fontconfig SYSTEM "fonts.dtd">' | sudo tee -a /etc/fonts/local.conf \
#    && echo '<fontconfig>' | sudo tee -a /etc/fonts/local.conf \
#    && echo '   <match>' | sudo tee -a /etc/fonts/local.conf \
#    && echo '       <edit mode="prepend" name="family"><string>Noto Sans</string></edit>' | sudo tee -a /etc/fonts/local.conf \
#    && echo '   </match>' | sudo tee -a /etc/fonts/local.conf \
#    && echo '   <match target="pattern">' | sudo tee -a /etc/fonts/local.conf \
#    && echo '       <test qual="any" name="family"><string>serif</string></test>' | sudo tee -a /etc/fonts/local.conf \
#    && echo '       <edit name="family" mode="assign" binding="same"><string>Noto Serif</string></edit>' | sudo tee -a /etc/fonts/local.conf \
#    && echo '   </match>' | sudo tee -a /etc/fonts/local.conf \
#    && echo '   <match target="pattern">' | sudo tee -a /etc/fonts/local.conf \
#    && echo '       <test qual="any" name="family"><string>sans-serif</string></test>' | sudo tee -a /etc/fonts/local.conf \
#    && echo '       <edit name="family" mode="assign" binding="same"><string>Noto Sans</string></edit>' | sudo tee -a /etc/fonts/local.conf \
#    && echo '   </match>' | sudo tee -a /etc/fonts/local.conf \
#    && echo '   <match target="pattern">' | sudo tee -a /etc/fonts/local.conf \
#    && echo '       <test qual="any" name="family"><string>monospace</string></test>' | sudo tee -a /etc/fonts/local.conf \
#    && echo '       <edit name="family" mode="assign" binding="same"><string>Noto Mono</string></edit>' | sudo tee -a /etc/fonts/local.conf \
#    && echo '   </match>' | sudo tee -a /etc/fonts/local.conf \
#    && echo '</fontconfig>' | sudo tee -a /etc/fonts/local.conf

RUN yay --noconfirm -S jdk-openjdk \
    && sudo archlinux-java set java-13-openjdk

RUN yay --noconfirm -S intellij-idea-ultimate-edition
COPY .IntelliJIdea2019.2 .IntelliJIdea2019.2
RUN sudo chmod -R ugo+rwx .IntelliJIdea2019.2

RUN yay --noconfirm -S yarn \
    && echo 'export PATH="$PATH:$(yarn global bin)"' | sudo tee -a ~/.bashrc

RUN yarn global add @angular/cli \
    && $(yarn global bin)/ng config -g cli.packageManager yarn

RUN yay --noconfirm -S python python-pip

RUN yay --noconfirm -S git

CMD [ "/opt/intellij-idea-ultimate-edition/bin/idea.sh" ]
