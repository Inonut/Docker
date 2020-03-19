FROM archlinux

COPY mirrorlist /etc/pacman.d/mirrorlist

RUN pacman -Sy && \
    pacman --noconfirm -S \
	# basic packages
		bash bash-completion openssl openssh nano tar wget base-devel ncdu procps iputils unzip \
	# credentiuals
	    libsecret gnome-keyring \
	# GUI fonts
		noto-fonts \
	# user utils
		shadow \
	# C++ build tools
		cmake gcc linux-headers glibc \
	# Java
	    jdk-openjdk maven npm yarn gradle svn git python python-pip

# Install tool to list secrets
#RUN wget https://gitlab.com/GrantMoyer/lssecret/-/archive/master/lssecret-master.tar.gz && \
#    tar -xf lssecret-master.tar.gz && \
#    make -C lssecret-master install

# Install IntelliJ Ultimate
ARG IDEA_VERSION=2019.3.4-no-jbr
RUN wget https://download.jetbrains.com/idea/ideaIU-$IDEA_VERSION.tar.gz && \
	tar -xf ideaIU-$IDEA_VERSION.tar.gz && \
	rm ideaIU-$IDEA_VERSION.tar.gz && \
    mv idea-IU-* idea-IU

# Create a new user with no password
#ENV USER developer
#ENV PASSWORD asd
#RUN useradd -r -m -G wheel -u 1000 -s /bin/bash $USER && \
#	echo -e "$PASSWORD\n$PASSWORD" | passwd $USER && \
#	echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
#	echo "Set disable_coredump false" > /etc/sudo.conf
#RUN echo -e "$PASSWORD\n$PASSWORD" | passwd
#
#RUN dbus-uuidgen > /var/lib/dbus/machine-id

# Set additional environment variables
#ENV PATH  "$PATH:$(yarn global bin)"

#USER $USER
WORKDIR /root

## Install aur dbus-x11
#RUN su - $USER -c "git clone https://aur.archlinux.org/dbus-x11.git && \
#    cd dbus-x11 && \
#    yes | makepkg -si && \
#    cd .. && \
#    rm -fr dbus-x11"

# Install "seahorse" to generate keyrings with passward "\n"
#COPY keyrings .local/share/keyrings

#COPY .bashrc /home/$USER/.bashrc
COPY .bashrc .bashrc

COPY .gitconfig .gitconfig

COPY idea-conf .IntelliJIdea_default

COPY startup.sh startup.sh
RUN sudo chmod +x startup.sh

ENTRYPOINT /root/startup.sh
