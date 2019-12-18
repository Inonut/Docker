FROM archlinux/base

COPY mirrorlist /etc/pacman.d/mirrorlist

RUN pacman -Sy && \
    pacman --noconfirm -S \
	# basic packages
		bash bash-completion coreutils file grep openssl openssh nano sudo tar xz procps wget pkgconf base-devel \
	# credentiuals
	    libsecret gnome-keyring \
	# debug tools
		gdb strace \
	# GUI fonts
		noto-fonts \
	# user utils
		shadow \
	# C++ build tools
		cmake gcc git linux-headers glibc make \
	# Python
	    python-pip python \
	# Java tools
		gradle jdk8-openjdk \
    # Web tools
        yarn nodejs

RUN yarn global add @angular/cli && \
    $(yarn global bin)/ng config -g cli.packageManager yarn

# Install IntelliJ Ultimate
ARG IDEA_VERSION=2019.2.4-no-jbr
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
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV JDK_HOME  /usr/lib/jvm/java-1.8-openjdk
ENV JAVA_EXE  /usr/lib/jvm/java-1.8-openjdk/bin/java
ENV PATH  "$PATH:$(yarn global bin)"

USER $USER
WORKDIR /home/$USER

# Install aur dbus-x11
RUN git clone https://aur.archlinux.org/dbus-x11.git && \
    cd dbus-x11 && \
    yes | makepkg -si

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
