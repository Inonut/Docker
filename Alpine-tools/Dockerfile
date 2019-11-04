FROM alpine:edge

RUN apk --no-cache --update add \
	# basic packages
		bash bash-completion coreutils file grep openssl openssh nano sudo tar xz procps \
	# credentiuals
	    libsecret libsecret-dev dbus-x11 gnome-keyring \
	# debug tools
		gdb musl-dbg strace \
	# GUI fonts
		font-noto \
	# user utils
		shadow \
	# C++ build tools
		cmake g++ git linux-headers libpthread-stubs make \
	# Python
	    py2-pip \
	# Java tools
		gradle openjdk8 openjdk8-dbg \
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
RUN useradd --create-home --key MAIL_DIR=/dev/null --shell /bin/bash $USER && \
	passwd -d $USER && \
	echo "$USER ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$USER && \
	chown -R $USER /home/$USER

# Set additional environment variables
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV JDK_HOME  /usr/lib/jvm/java-1.8-openjdk
ENV JAVA_EXE  /usr/lib/jvm/java-1.8-openjdk/bin/java
ENV PATH  "$PATH:$(yarn global bin)"

USER $USER
WORKDIR /home/$USER

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


