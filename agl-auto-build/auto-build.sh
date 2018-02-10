#!/bin/bash

if [ $# -ne 1 ]; then
    echo "len=$#"
    echo "must be set target qemux86_64/..." 1>&2
    exit 1
fi

mkdir -p $HOME/auto-build
mkdir -p $HOME/YOCTO

d_user='d-worker'
d_group='d-worker'

target=$1

image_name='agl-auto-build:0.1'
container_name='agl-builder'

local_build_top=/home1/$USER/auto-build

docker build -t $image_name .

# /home/YOCTO is yocto download/sstate-cache directory

docker run --rm \
	      -h agl-auto-build \
	      -u $d_user:$d_group \
	      -v $local_build_top:/home/$d_user/auto-build \
      	      -v /home/YOCTO:/home/YOCTO \
      	      -e LANG=en_US.UTF-8 \
	      -w /home/$d_user/auto-build \
	      --name $container_name \
	      -t $image_name \
	      ../build_bootstrap.sh $target


