FROM draducanu/archlinux-gui

RUN yay --noconfirm -S google-chrome
RUN yay --noconfirm -S nspr glibc
RUN yay --noconfirm -S alsa-utils pulseaudio

CMD ["/usr/bin/google-chrome-stable"]
