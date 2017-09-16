FROM nvidia/cuda:8.0-cudnn5-devel

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    python3-dev \
    python3-pip && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

# chainer request package
RUN apt-get update -y && \
    apt-get install -y python3-tk

# chainer request python package 
RUN pip3 install setuptools matplotlib wheel

RUN pip3 install cupy==2.0.0rc1 chainer==3.0.0rc1

# chainer my devlopment package 
RUN apt-get update -y && \
    apt-get install -y \
    emacs \
    git

# user, group variable
ARG USER="d-worker"
ARG GROUP="d-worker"
ARG UID="1000"
ARG GID="1000"

# add development user
RUN groupadd -g $GID $GROUP && useradd -u $UID -g $GID -m $USER
WORKDIR /home/$USER
USER $USER
RUN mkdir work

