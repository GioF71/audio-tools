#!/bin/bash

set -e

SERVICE_FILE_NAME=vncserver.service
SYSTEMD_SERVICE="$HOME/.config/systemd/user/${SERVICE_FILE_NAME}"
if [ -f "${SERVICE_FILE_NAME}" ]; then
    if [ -f "${SYSTEMD_SERVICE}" ]; then
        rm "${SYSTEMD_SERVICE}"
        ln "$SERVICE_FILE_NAME" "${SYSTEMD_SERVICE}"
        echo "Reloading systemd ..."
        systemctl --user daemon-reload
        echo "Systemd reloaded."
    fi
else
    echo "Service file ${SERVICE_FILE_NAME} missing, create with service-create.sh"
fi
