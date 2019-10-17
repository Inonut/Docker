FROM draducanu/archlinux-gui

RUN yay --noconfirm -S intellij-idea-ultimate-edition jdk8-openjdk && yay --noconfirm -Scc
RUN sudo archlinux-java set java-8-openjdk

CMD ["/opt/intellij-idea-ultimate-edition/bin/idea.sh"]
