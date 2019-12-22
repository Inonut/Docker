FROM draducanu/arch-idea

RUN sudo pacman --noconfirm -Sy android-tools

ARG FLUTTER_VERSION=v1.12.13+hotfix.5-stable
RUN wget https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_$FLUTTER_VERSION.tar.xz && \
	tar -xf flutter_linux_$FLUTTER_VERSION.tar.xz && \
	rm flutter_linux_$FLUTTER_VERSION.tar.xz

RUN mkdir -p ~/Android/Sdk
WORKDIR /home/$USER/Android/Sdk

ARG ANDROID_VERSION=4333796
RUN wget https://dl.google.com/android/repository/sdk-tools-linux-$ANDROID_VERSION.zip && \
	unzip sdk-tools-linux-$ANDROID_VERSION.zip && \
	rm sdk-tools-linux-$ANDROID_VERSION.zip

ARG ANDROID_VERSION=28
RUN yes | tools/bin/sdkmanager --install "build-tools;$ANDROID_VERSION.0.2" "platform-tools" "sources;android-$ANDROID_VERSION" "platforms;android-$ANDROID_VERSION"

ENV PATH "$PATH:~/flutter/bin"