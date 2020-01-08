FROM draducanu/arch-idea

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
RUN yes | tools/bin/sdkmanager --install "build-tools;$ANDROID_VERSION.0.3" "platform-tools" "sources;android-$ANDROID_VERSION" "platforms;android-$ANDROID_VERSION"
RUN yes | ~/flutter/bin/flutter doctor --android-licenses && \
    ~/flutter/bin/flutter channel master && \
    ~/flutter/bin/flutter upgrade && \
    ~/flutter/bin/flutter config --enable-web && \
    ~/flutter/bin/flutter devices

ENV PATH "$PATH:~/flutter/bin:~/Android/Sdk/platform-tools"