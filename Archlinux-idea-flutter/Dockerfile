FROM draducanu/arch-idea

RUN sudo pacman --noconfirm -Sy android-tools

ENV FLUTTER_VERSION=v1.12.13+hotfix.5-stable
RUN wget https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_$FLUTTER_VERSION.tar.xz && \
	tar -xf flutter_linux_$FLUTTER_VERSION.tar.xz && \
	rm flutter_linux_$FLUTTER_VERSION.tar.xz

ENV ANDROID_VERSION=4333796
RUN wget https://dl.google.com/android/repository/sdk-tools-linux-$ANDROID_VERSION.zip && \
	unzip sdk-tools-linux-$ANDROID_VERSION.zip && \
	rm sdk-tools-linux-$ANDROID_VERSION.zip

ENV ANDROID_VERSION=29
RUN mkdir -p ~/Android/Sdk && \
    yes | ~/tools/bin/sdkmanager --install "build-tools;$ANDROID_VERSION.0.2" "system-images;android-$ANDROID_VERSION;google_apis_playstore;x86_64" "platform-tools" "sources;android-$ANDROID_VERSION" "platforms;android-$ANDROID_VERSION" && \
    mv ~/build-tools ~/Android/Sdk/build-tools && \
    mv ~/emulator ~/Android/Sdk/emulator && \
    mv ~/patcher ~/Android/Sdk/patcher && \
    mv ~/platforms ~/Android/Sdk/platforms && \
    mv ~/platform-tools ~/Android/Sdk/platform-tools && \
    mv ~/sources ~/Android/Sdk/sources && \
	mv ~/tools ~/Android/Sdk/tools

ENV PATH "$PATH:~/flutter/bin"