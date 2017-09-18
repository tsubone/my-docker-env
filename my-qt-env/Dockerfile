FROM ubuntu:16.04

# Install lots of packages
RUN apt-get update -y && apt-get install -y \
    libxcb-keysyms1-dev libxcb-image0-dev \
    libxcb-shm0-dev libxcb-icccm4-dev libxcb-sync0-dev libxcb-xfixes0-dev \
    libxcb-shape0-dev libxcb-randr0-dev libxcb-render-util0-dev \
    libfontconfig1-dev libfreetype6-dev libx11-dev libxext-dev libxfixes-dev \
    libxi-dev libxrender-dev libxcb1-dev libx11-xcb-dev libxcb-glx0-dev x11vnc \
    xauth build-essential mesa-common-dev libglu1-mesa-dev libxkbcommon-dev \
    libxcb-xkb-dev libxslt1-dev libgstreamer-plugins-base0.10-dev wget

# my devlopment package 
RUN apt-get update -y && \
    apt-get install -y \
    emacs \
    gitk \
    git-el

# download qt download script
RUN wget http://download.qt.io/official_releases/online_installers/qt-unified-linux-x64-online.run
RUN chmod +x ./qt-unified-linux-x64-online.run

# user, group variable
ARG USER="d-worker"
ARG GROUP="d-worker"
ARG UID="1000"
ARG GID="1000"
ARG PASSWD="password"

# for sudo command
RUN apt-get update -y && \
    apt-get install -y sudo

# add development user
RUN groupadd -g $GID $GROUP && useradd -u $UID -g $GID -G sudo -m $USER
RUN echo "$USER:$PASSWD" | chpasswd
WORKDIR /home/$USER
USER $USER
RUN mkdir work

ENTRYPOINT ./qt-unified-linux-x64-online.run
