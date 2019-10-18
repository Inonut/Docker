FROM draducanu/archlinux-user

# install GUI dependences
RUN sudo pacman --noconfirm -Sy \
    && sudo pacman --noconfirm -S base-devel libxrender gtk3 git \
# install yay for aur dependences
	&& git clone https://aur.archlinux.org/yay.git \
	&& cd yay \
	&& makepkg --noconfirm -si \
	&& cd .. \
	&& rm -fr yay \
# install fonts for better apparences
	&& yay --noconfirm -S ttf-dejavu ttf-liberation noto-fonts \
    && sudo ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d \
    && sudo ln -s /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d \
    && sudo ln -s /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d \
    && echo 'export FREETYPE_PROPERTIES="truetype:interpreter-version=40"' | sudo tee -a /etc/profile.d/freetype2.sh \
    && echo '<?xml version="1.0"?>' | sudo tee -a /etc/fonts/local.conf \
    && echo '<!DOCTYPE fontconfig SYSTEM "fonts.dtd">' | sudo tee -a /etc/fonts/local.conf \
    && echo '<fontconfig>' | sudo tee -a /etc/fonts/local.conf \
    && echo '   <match>' | sudo tee -a /etc/fonts/local.conf \
    && echo '       <edit mode="prepend" name="family"><string>Noto Sans</string></edit>' | sudo tee -a /etc/fonts/local.conf \
    && echo '   </match>' | sudo tee -a /etc/fonts/local.conf \
    && echo '   <match target="pattern">' | sudo tee -a /etc/fonts/local.conf \
    && echo '       <test qual="any" name="family"><string>serif</string></test>' | sudo tee -a /etc/fonts/local.conf \
    && echo '       <edit name="family" mode="assign" binding="same"><string>Noto Serif</string></edit>' | sudo tee -a /etc/fonts/local.conf \
    && echo '   </match>' | sudo tee -a /etc/fonts/local.conf \
    && echo '   <match target="pattern">' | sudo tee -a /etc/fonts/local.conf \
    && echo '       <test qual="any" name="family"><string>sans-serif</string></test>' | sudo tee -a /etc/fonts/local.conf \
    && echo '       <edit name="family" mode="assign" binding="same"><string>Noto Sans</string></edit>' | sudo tee -a /etc/fonts/local.conf \
    && echo '   </match>' | sudo tee -a /etc/fonts/local.conf \
    && echo '   <match target="pattern">' | sudo tee -a /etc/fonts/local.conf \
    && echo '       <test qual="any" name="family"><string>monospace</string></test>' | sudo tee -a /etc/fonts/local.conf \
    && echo '       <edit name="family" mode="assign" binding="same"><string>Noto Mono</string></edit>' | sudo tee -a /etc/fonts/local.conf \
    && echo '   </match>' | sudo tee -a /etc/fonts/local.conf \
    && echo '</fontconfig>' | sudo tee -a /etc/fonts/local.conf \
# install tools
    && yay --noconfirm -S intellij-idea-ultimate-edition jdk-openjdk yarn python python-pip \
    && sudo archlinux-java set java-13-openjdk \
# clear cache
    && yay --noconfirm -Scc

# run idea
CMD ["/opt/intellij-idea-ultimate-edition/bin/idea.sh"]
