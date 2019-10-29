FROM alpine

RUN apk --no-cache --update add \
	# basic packages
		bash bash-completion coreutils file grep openssl openssh nano sudo tar xz \
	# debug tools
		gdb musl-dbg strace \
	# GUI fonts
		font-noto \
	# user utils
		shadow \
	# C++ build tools
		cmake g++ git linux-headers libpthread-stubs make \
	# Java tools
		gradle openjdk8 openjdk8-dbg \
    # Web tools
        yarn nodejs

# Install IntelliJ Ultimate
ARG IDEA_VERSION=2019.2.4-no-jbr
RUN wget https://download.jetbrains.com/idea/ideaIU-$IDEA_VERSION.tar.gz && \
	tar -xf ideaIU-$IDEA_VERSION.tar.gz && \
	rm ideaIU-$IDEA_VERSION.tar.gz

# Create a new user with no password
ENV USERNAME developer
RUN useradd --create-home --key MAIL_DIR=/dev/null --shell /bin/bash $USERNAME && \
	passwd -d $USERNAME && \
	echo "$USERNAME ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME && \
	chown -R $USERNAME /home/$USERNAME

# Set additional environment variables
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV JDK_HOME  /usr/lib/jvm/java-1.8-openjdk
ENV JAVA_EXE  /usr/lib/jvm/java-1.8-openjdk/bin/java

USER $USERNAME
WORKDIR /home/$USERNAME

RUN echo 'export PS1="\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$ \[\033[00m\]"' | sudo tee -a ~/.bashrc && \
    echo 'export PATH="$PATH:$(yarn global bin)"' | sudo tee -a ~/.bashrc

RUN yarn global add @angular/cli && \
    $(yarn global bin)/ng config -g cli.packageManager yarn

COPY .IntelliJIdea2019.2 .IntelliJIdea2019.2
RUN sudo chmod -R ugo+rwx .IntelliJIdea2019.2

CMD /idea-IU-192.7142.36/bin/idea.sh
