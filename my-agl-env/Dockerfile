FROM ubuntu:16.04

ENV http_proxy http://proxy.mei.co.jp:8080
ENV https_proxy https://proxy.mei.co.jp:8080

# agl tools written in Automotive Grade Linux Wiki
RUN apt-get update -y && \
    apt-get install -y \
    	    gawk wget git-core diffstat unzip texinfo gcc-multilib \
	    build-essential chrpath socat libsdl1.2-dev xterm cpio curl

# agl tools written in Automotive Grade Linux Wiki
RUN apt-get update -y && \
    apt-get install -y repo

# agl tools written in Automotive Grade Linux Wiki
RUN apt-get update -y && \
    apt-get install -y \
    	    python3 \
	    git \
	    gcc

# agl for ping tools used from E.E.
RUN apt-get update -y && \
    apt-get install -y \
    	    inetutils-ping \
	    net-tools

# to avoid bitbake utf-8 error
RUN apt-get update -y && \
    apt-get install -y locales 
RUN locale-gen en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

# my devlopment package 
RUN apt-get update -y && \
    apt-get install -y \
    emacs \
    gitk \
    git-el

# user, group variable
ARG USER="d-worker"
ARG GROUP="d-worker"
ARG UID="1000"
ARG GID="1000"
ARG PASSWD="password"
ARG EMAIL="d-worker@agl-dev"

# for sudo command
RUN apt-get update -y && \
    apt-get install -y sudo

RUN apt-get update -y && \
    apt-get install -y corkscrew

RUN mkdir -p /usr/local/bin
ADD git-proxy /usr/local/bin/git-proxy
RUN chmod 755 /usr/local/bin/git-proxy

# add development user
RUN groupadd -g $GID $GROUP && useradd -u $UID -g $GID -G sudo -m $USER
RUN echo "$USER:$PASSWD" | chpasswd
WORKDIR /home/$USER
USER $USER
RUN mkdir work

RUN git config --global user.name $USER
RUN git config --global user.email $EMAIL

RUN git config --global	core.gitproxy /usr/local/bin/git-proxy
RUN git config --global http.proxy http://proxy.mei.co.jp:8080
RUN git config --global https.proxy https://proxy.mei.co.jp:8080

RUN mkdir -p /home/$USER/.ssh
ADD --chown=d-worker:d-worker ssh-config /home/$USER/.ssh/config
RUN chmod 644 /home/$USER/.ssh/config
