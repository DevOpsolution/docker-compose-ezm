#!/bin/bash

set +e

DIR=`cd "$(dirname "$0")" && pwd`
source $DIR/common.sh

set +o noglob

item=0

workdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $workdir

h2 "[Step $item]: checking if docker is installed ..."; let item+=1
check_docker

h2 "[Step $item]: checking docker-compose is installed ..."; let item+=1
check_dockercompose

if [ -n "$(docker-compose ps -q)" ]
then
  note "stopping existing easy-monitor instance ..."
  docker-compose down -v
fi

h2 "[Step $item]: creating easy-monitor network ..."; let item+=1
if [ -z "$(docker network ls | grep ezm-network)" ]
then
  docker network create ezm-network -o com.docker.network.bridge.name=ezm-network
fi

h2 "[Step $item]: starting easy-monitor ..."
docker-compose up -d

success $"----easy-monitor has been installed and started successfully.----"