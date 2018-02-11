FROM ubuntu:16.04

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
    	    inetutils-ping 

# agl for ping tools used from E.E.
#RUN apt-get update -y && \
#    apt-get install -y \
#    	    inetutils-ping \
#	    net-tools

# to avoid bitbake utf-8 error
RUN apt-get update -y && \
    apt-get install -y locales 
RUN locale-gen en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

# my devlopment package 
#RUN apt-get update -y && \
#    apt-get install -y \
#    gitk \

# user, group variable
ARG USER="d-worker"
ARG GROUP="d-worker"
ARG UID="1000"
ARG GID="1000"
ARG PASSWD="password"

# for sudo command
#RUN apt-get update -y && \
#    apt-get install -y sudo

# add build/development user
RUN groupadd -g $GID $GROUP && useradd -u $UID -g $GID -G sudo -m $USER
RUN echo "$USER:$PASSWD" | chpasswd

WORKDIR /home/$USER
USER $USER
RUN mkdir auto-build

# download and extract build tools
#ADD --chown=$USER:$GROUP https://github.com/tsubone/agl-utils/archive/master.tar.gz .
#ADD --chown=d-user:$GROUP https://github.com/tsubone/agl-utils/archive/master.tar.gz .
ADD --chown=1000:1000 https://github.com/tsubone/agl-utils/archive/master.tar.gz .
RUN tar xvzf master.tar.gz
RUN mv agl-utils-master agl-utils
#RUN git clone https://github.com/tsubone/agl-utils.git

COPY build_bootstrap.sh .
