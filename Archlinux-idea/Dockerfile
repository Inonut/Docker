FROM archlinux/base

COPY mirrorlist /etc/pacman.d/mirrorlist

RUN pacman -Sy && \
    pacman --noconfirm -S \
	# basic packages
		bash bash-completion openssl openssh nano sudo tar wget make pkgconf base-devel ncdu procps iputils unzip \
	# credentiuals
	    libsecret gnome-keyring \
	# GUI fonts
		noto-fonts \
	# user utils
		shadow \
	# C++ build tools
		cmake gcc git linux-headers glibc make \
	# Java
	    jdk8-openjdk

# Install IntelliJ Ultimate
ARG IDEA_VERSION=2019.3-no-jbr
RUN wget https://download.jetbrains.com/idea/ideaIU-$IDEA_VERSION.tar.gz && \
	tar -xf ideaIU-$IDEA_VERSION.tar.gz && \
	rm ideaIU-$IDEA_VERSION.tar.gz && \
    mv idea-IU-* idea-IU

# Install tool to list secrets
RUN wget https://gitlab.com/GrantMoyer/lssecret/-/archive/master/lssecret-master.tar.gz && \
    tar -xf lssecret-master.tar.gz && \
    make -C lssecret-master install

# Create a new user with no password
ENV USER developer
RUN useradd -m -G wheel -s /bin/bash $USER && \
	passwd -d $USER && \
	echo "$USER ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$USER && \
	chown -R $USER /home/$USER

RUN dbus-uuidgen > /var/lib/dbus/machine-id

# Set additional environment variables
ENV PATH  "$PATH:$(yarn global bin)"

USER $USER
WORKDIR /home/$USER

# Install aur dbus-x11
RUN git clone https://aur.archlinux.org/dbus-x11.git && \
    cd dbus-x11 && \
    yes | makepkg -si && \
    cd .. && \
    rm -fr dbus-x11

# Install "seahorse" to generate keyrings with passward "\n"
COPY keyrings .local/share/keyrings
RUN sudo chmod -R ugo+rwx .local/share/keyrings

COPY .bashrc .bashrc
RUN sudo chmod -R ugo+rwx .bashrc

COPY .gitconfig .gitconfig
RUN sudo chmod -R ugo+rwx .gitconfig

COPY startup.sh startup.sh
RUN sudo chmod -R ugo+rwx startup.sh

ENTRYPOINT ~/startup.sh