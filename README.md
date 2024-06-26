# audio-tools

These are a set of audio tools I have prepared over time for my own necessities.

## Players

Most of the following player configuration are built using docker-compose files and environment variables with defaults on the compose file itself, customizable using a `.env` file.  
Your own `.env` should generally be initialized by duplicating the `sample.env` file using the command:

```text
cp sample.env .env
```

from each directory.  
After this step, you can proceed with tuning. It is generally very simple. Refer to the upstream project for more details in case of doubts.  
All the docker-compose based configurations allow you to specify a docker registry other than docker.io (the default) using the environment variable `IMAGE_REGISTRY`, in case you have a pull-through cache registry on your network.  

### SqueezeLite

#### SqueezeLite References

These player configurations rely on my [squeezelite-docker](https://github.com/GioF71/squeezelite-docker) repository and on the related [docker images](https://hub.docker.com/r/giof71/squeezelite).  
The following configurations are very simple configuration, which might be a good starting point or a good fit if you do not need very specific setting (like, e.g. upsampling, excluding codecs, etc).  

#### SqueezeLite

VARIABLE|DESCRIPTION|DEFAULT
:---|:---|:---
SQUEEZELITE_NAME|Name of the player|SqueezeLite
SQUEEZELITE_AUDIO_DEVICE|Audio device|default
SQUEEZELITE_SERVER_PORT|Address and port of your server, it is mandatory to specify appropriately|`lms.homelab.local:3843`
SQUEEZELITE_VOLUME_CONTROL|Volume Control
SQUEEZELITE_PARAMS|Squeezelite Params

### Upnp-Renderer

#### Upnp-Renderer References

These player configurations rely on my [upmpdcli-docker](https://github.com/GioF71/upmpdcli-docker) repository and on the related [docker images](https://hub.docker.com/r/giof71/upmpdcli).  
MPD is also needed, and we will use the [mpd-alsa-docker](https://github.com/GioF71/mpd-alsa-docker) repository and on the related [docker images](https://hub.docker.com/r/giof71/mpd-alsa).  
The following configurations are very simple configuration, which might be a good starting point or a good fit if you do not need very specific setting (like, e.g. upsampling, additional outputs, etc).  

#### Simple

VARIABLE|DESCRIPTION|DEFAULT
:---|:---|:---
MPD_TAG|Selected tag for mpd-alsa|vanilla
MPD_BIND_ADDRESS|Bind address for mpd|127.0.0.1
MPD_HOST|Address of mpd|127.0.0.1
MPD_PORT|Port used by mpd|6600
MPD_ALSA_DEVICE|Alsa output device for mpd|default
MPD_MIXER_TYPE|Mixer mode|software
FRIENDLY_NAME|Name of the upnp/dlna player|UpnpRenderer
RENDERER_MODE|Can be OPENHOME, UPNPAV or BOTH|BOTH
CHECK_CONTENT_FORMAT|Check if the content is playable|yes
PUID|The user id which will will run upmpdcli, defaults to `1000`
GUID|The group id which will will run upmpdcli, defaults to `1000`

#### User Mode

VARIABLE|DESCRIPTION|DEFAULT
:---|:---|:---
MPD_TAG|Selected tag for mpd-alsa|vanilla
MPD_BIND_ADDRESS|Bind address for mpd|127.0.0.1
MPD_HOST|Address of mpd|127.0.0.1
MPD_PORT|Port used by mpd|6600
MPD_ALSA_DEVICE|Alsa output device for mpd|default
MPD_MIXER_TYPE|Mixer mode|software
FRIENDLY_NAME|Name of the upnp/dlna player|UpnpRenderer
RENDERER_MODE|Can be OPENHOME, UPNPAV or BOTH|BOTH
CHECK_CONTENT_FORMAT|Check if the content is playable|yes
PUID|Mandatory user id which will will run the containers, defaults to `1000`
AUDIO_GID|Mandatory group id of the audio group, will be used to run the containers, defaults to `29`

### Spotify Connect (LibreSpot)

#### LibreSpot References

These player configurations rely on my [librespot](https://github.com/GioF71/librespot-docker) repository and on the related [docker images](https://hub.docker.com/r/giof71/librespot).  

#### Alsa

VARIABLE|DESCRIPTION|DEFAULT
:---|:---|:---
ALSA_DEVICE|Alsa output device for mpd|default
ALSA_FORMAT|Output format|S16
BITRATE|Audio Quality|320
INITIAL_VOLUME|Initial volume|100
DEVICE_TYPE|Device type (icon in Spotify)|speaker
DEVICE_NAME|Name of the player|LibreSpot

### Tidal Connect

This is a cross-link: for tidal-connect, please refer to [this repository](https://github.com/GioF71/tidal-connect).

## xfce-vnc

Allows to create a xfce-based vnc session with the possibility of installing upplay, pulseaudio and pulseaudio-dlna.  
This allows to use a browser to play to any dlna renderer easily, even from a windows desktop.  
The scripts currenly work on debian bullseye.  
More information to come asap.  
