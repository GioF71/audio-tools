#!/bin/bash

# try to stop anyway
systemctl --user stop vncserver.service

source ../util/load_config.sh

load_config .config

set -ex

SERVICE_FILE_NAME=vncserver.service
SYSTEMD_PATH="$HOME/.config/systemd/user"
SYSTEMD_SERVICE="${SYSTEMD_PATH}/${SERVICE_FILE_NAME}"

echo "SERVICE_FILE_NAME=[$SERVICE_FILE_NAME]"
echo "SYSTEMD_SERVICE=[$SYSTEMD_SERVICE]"

VNC_PASSWORD="${config[VNC_PASSWORD]}"
if [ -z "${VNC_PASSWORD}" ]; then
  echo "Using default for VNC_PASSWORD"
  VNC_PASSWORD=password
fi

echo "VNC_PASSWORD=[$VNC_PASSWORD]"

mkdir -p ${HOME}/.vnc
echo $VNC_PASSWORD | vncpasswd -f > $HOME/.vnc/passwd
chmod 600 $HOME/.vnc/passwd

#touch $HOME/.vnc/`hostname`:1.pid

if [ -f "${SERVICE_FILE_NAME}" ]; then
        if [ -f "${SYSTEMD_SERVICE}" ]; then 
		rm "${SYSTEMD_SERVICE}"
	fi
	mkdir -p "${SYSTEMD_PATH}"	
	ln "$SERVICE_FILE_NAME" "${SYSTEMD_SERVICE}"
	echo "Reloading systemd ..."
	systemctl --user daemon-reload
	echo "Systemd reloaded, enabling ..."
	systemctl --user enable vncserver.service --now
	echo "Service enabled"
else
	echo "Service file ${SERVICE_FILE_NAME} missing, create with service-vnc-create.sh"
fi
