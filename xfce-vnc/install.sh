#!/bin/bash

source ../util/load_config.sh

load_config .config

source ./install-minimal.sh

INSTALL_CHROMIUM="${config[INSTALL_CHROMIUM]}"
if [ "${INSTALL_CHROMIUM^^}" == "TRUE" ]; then
  echo "Installing Chromium"
  source ./install-chromium.sh
else
  echo "Not installing Chromium"
fi

INSTALL_PULSEAUDIO="${config[INSTALL_PULSEAUDIO]}"
if [ "${INSTALL_PULSEAUDIO^^}" == "TRUE" ]; then
  echo "Installing PulseAudio"
  source ./install-pulseaudio.sh
else
  echo "Not installing PulseAudio"
fi

INSTALL_PULSEAUDIO_DLNA="${config[INSTALL_PULSEAUDIO_DLNA]}"
if [ "${INSTALL_PULSEAUDIO_DLNA^^}" == "TRUE" ]; then
  echo "Installing PulseAudio-DLNA"
  source ./install-pulseaudio-dlna.sh
else
  echo "Not installing PulseAudio-DLNA"
fi

INSTALL_UPPLAY="${config[INSTALL_UPPLAY]}"
if [ "${INSTALL_UPPLAY^^}" == "TRUE" ]; then
  echo "Installing upplay"
  source ./install-upplay.sh
else
  echo "Not installing upplay"
fi


