FROM draducanu/archlinux-gui

RUN yay --noconfirm -S jdk-openjdk \
    && sudo archlinux-java set java-13-openjdk

RUN yay --noconfirm -S intellij-idea-ultimate-edition 
COPY .IntelliJIdea2019.2 /home/dragos/.IntelliJIdea2019.2
RUN sudo chmod -R ugo+rwx /home/dragos/.IntelliJIdea2019.2

RUN yay --noconfirm -S yarn \
    && echo 'export PATH="$PATH:$(yarn global bin)"' | sudo tee -a ~/.bashrc

RUN yarn global add @angular/cli \
    && $(yarn global bin)/ng config -g cli.packageManager yarn

RUN yay --noconfirm -S python python-pip

RUN yay --noconfirm -S git \
    && echo $(dbus-uuidgen) | sudo tee -a /var/lib/dbus/machine-id

CMD [ "/opt/intellij-idea-ultimate-edition/bin/idea.sh" ]
