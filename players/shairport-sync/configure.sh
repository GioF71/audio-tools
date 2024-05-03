#!/bin/bash

source .env

CONFIG_FILE=shairport-sync.conf
rm $CONFIG_FILE

echo "PLAYER_NAME=[${PLAYER_NAME}]"
if [[ -n "${PLAYER_NAME}" ]]; then
    echo "Setting PLAYER_NAME to [${PLAYER_NAME}]"
    echo "general = " >> $CONFIG_FILE
    echo "{" >> $CONFIG_FILE
    echo "  name = \"${PLAYER_NAME}\";" >> $CONFIG_FILE
    echo "};" >> $CONFIG_FILE
else
    echo "PLAYER_NAME not set"
fi

echo "ALSA_OUTPUT_DEVICE=[$ALSA_OUTPUT_DEVICE]"
echo "ALSA_OUTPUT_FORMAT=[$ALSA_OUTPUT_FORMAT]"

# create alsa section if there is something relevant to set
if [[ -n "${ALSA_OUTPUT_DEVICE}" ]] || \
   [[ -n "${ALSA_OUTPUT_FORMAT}" ]]; then
    echo "alsa = " >> $CONFIG_FILE
    echo "{" >> $CONFIG_FILE
    if [[ -n "${ALSA_OUTPUT_DEVICE}" ]]; then
        echo "Setting ALSA_OUTPUT_DEVICE to [${ALSA_OUTPUT_DEVICE}]"
        echo "  output_device = \"${ALSA_OUTPUT_DEVICE}\";" >> $CONFIG_FILE
    fi
    if [[ -n "${ALSA_OUTPUT_FORMAT}" ]]; then
        echo "Setting ALSA_OUTPUT_FORMAT to [${ALSA_OUTPUT_FORMAT}]"
        echo "  output_format = \"${ALSA_OUTPUT_FORMAT}\";" >> $CONFIG_FILE
    fi
    echo "};" >> $CONFIG_FILE
else
    echo "ALSA_OUTPUT_DEVICE not set"
fi

echo "Configuration file:"
cat shairport-sync.conf