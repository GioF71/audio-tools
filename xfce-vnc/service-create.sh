#!/bin/bash

source ../util/load_config.sh

load_config .config

cp vncserver.service.template vncserver.service

VNC_GEOMETRY="${config[VNC_GEOMETRY]}"
if [ -z "${VNC_GEOMETRY}" ]; then
  VNC_DEPTH=1280x800
fi

VNC_DEPTH="${config[VNC_DEPTH]}"
if [ -z "${VNC_DEPTH}" ]; then
  VNC_DEPTH=16 
fi

sed -i "s/VNC_GEOMETRY/${VNC_GEOMETRY}/g" vncserver.service
sed -i "s/VNC_DEPTH/${VNC_DEPTH}/g" vncserver.service

cat vncserver.service

