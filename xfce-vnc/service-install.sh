#!/bin/bash

set -ex

SERVICE_FILE_NAME=vncserver.service
SYSTEMD_PATH="$HOME/.config/systemd/user"
SYSTEMD_SERVICE="${SYSTEMD_PATH}/${SERVICE_FILE_NAME}"

echo "SERVICE_FILE_NAME=[$SERVICE_FILE_NAME]"
echo "SYSTEMD_SERVICE=[$SYSTEMD_SERVICE]"

if [ -f "${SERVICE_FILE_NAME}" ]; then
        if [ -f "${SYSTEMD_SERVICE}" ]; then 
		rm "${SYSTEMD_SERVICE}"
	fi
	mkdir -p "${SYSTEMD_PATH}"	
	ln "$SERVICE_FILE_NAME" "${SYSTEMD_SERVICE}"
	echo "Reloading systemd ..."
	systemctl --user daemon-reload
	echo "Systemd reloaded."
else
	echo "Service file ${SERVICE_FILE_NAME} missing, create with service-create.sh"
fi
