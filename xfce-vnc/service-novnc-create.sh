#!/bin/bash

source ../util/load_config.sh

load_config .config

CERT_DIR=$HOME/certificate
if [[ -d "$CERT_DIR" ]]; then
    echo "Certificate directory [$CERT_DIR] already exists."
else
    echo "Home directory [$CERT_DIR] does not exist, will be created"
    mkdir -p $CERT_DIR
fi

CERT_FILE="${CERT_DIR}/novnc.pem"

if [[ -f "$CERT_FILE" ]]; then
    echo "Certificate file [${CERT_FILE}] already exists."
else
    echo "Certificate file [${CERT_FILE}] does not exist, creating ..."
    openssl req -x509 -nodes -newkey rsa:3072 \
        -keyout $CERT_FILE \
        -out $CERT_FILE \
        -days 3650 \
        -subj '/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com'
    echo "Certificate file [${CERT_FILE}] created."
fi

cp novncserver.service.template novncserver.service