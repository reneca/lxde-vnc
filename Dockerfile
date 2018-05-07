# Base on ubuntu:latest
FROM ubuntu:latest
MAINTAINER HERGAULT Jeremy <jeremy.hergault@overware.fr>
LABEL Description="lxde-vnc" Vendor="overware" Version="1.0"

COPY src/vnc.sh /usr/local/bin/
COPY src/pwd.txt /root/.pwd

ENV USER root

# Install all programs
RUN apt-get -y update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    apt-utils \
    software-properties-common \
    lxde-core \
    lxterminal \
    tightvncserver \
    xrdp \
    vim \
    gedit \
    net-tools \
    terminator \
    wget \
    curl \
    git \
    meld \
    firefox \
    transmission-qt \
    vlc \
    openssl \
    gnupg2 \
    gpa \
 && add-apt-repository -y ppa:webupd8team/atom && apt-get -y update && apt-get -y install atom \
 && apt-get purge -y pm-utils xscreensaver* \
 && apt-get autoremove -y --purge \
 && apt-get -y clean \
 && apt-get -y autoclean \
 && chmod +x /usr/local/bin/vnc.sh \
 && sed -i '0,/port=-1/{s/port=-1/port=5901/}' /etc/xrdp/xrdp.ini \
 && cat /root/.pwd /root/.pwd | vncpasswd \
 && rm -rf /root/.pwd /tmp/*

# Expose VNC
EXPOSE 5901

ENTRYPOINT ["/usr/local/bin/vnc.sh"]


# End of Dockerfile
