# Upmpdcli Tidal Hires

## Description

This script and compose file will allow you to create a media server for Tidal, with support for HiRes lossless audio.  
A premium Tidal Account is required.  

## Limitations

The only renderers know to be working with Tidal in hires mode (so using the variable `TIDAL_AUDIO_QUALITY` set to `HI_RES_LOSSLESS`) with upmpdcli as the media server are:

- the combination of mpd and upmpdcli (as a renderer) [docker images [here](https://github.com/GioF71/mpd-alsa-docker) and [here](https://github.com/GioF71/upmpdcli-docker))
- [gmrender-resurrect](https://github.com/hzeller/gmrender-resurrect), docker image ([here](https://github.com/GioF71/gmrender-resurrect-docker))
  
The limitation is due to the fact that the player must be able to play a `mpd manifest`.  
When using the lower quality modes, almost every UPnP/DLNA player should be able to stream correctly.

## Instructions

### Get the credentials

#### For HI_RES_LOSSLESS

Clone this repository and move to the media-servers/tidal-hires directory (this directory).  
Execute the `get-pkce-credentials.sh` script, and follow the instructions.  
Read those instructions very carefully. It's actually a very simple process.  
You will have to click a link, login to Tidal if you haven't already, authorize the request, then paste the Oops url to the console and finally press ENTER.  
In order to run the script, use the following command, from this directory:

`./get-pkce-credentials.sh`

#### For HI_RES and below

Clone this repository and move to the media-servers/tidal-hires directory (this directory).  
Execute the `get-oauth2-credentials.sh` script, and follow the instructions.  
Read those instructions very carefully. It's actually a very simple process.  
You will have to click a link, login to Tidal if you haven't already, and then simply authorize the request.  
In order to run the script, use the following command, from this directory:

`./get-oauth2-credentials.sh`

#### Caveat

If you generate both credentials file, upmpdcli will use the pkce version by default. If you don't want this and want to use the regular (oauth2) version of the credentials, just delete the file `pkce.credentials.json` from the `cache/tidal` directory.

### Tune your settings

This is not mandatory, but you can copy the provided `sample.env` to your own `.env` file.  
Copy the files:

```text
cp sample.env .env
```

Edit you `.env` file, instructions and options are in the file itself.  
Carefully configure the `TIDAL_AUDIO_QUALITY`, according to the authentication type for which you have created the credentials file.  
Also tune `FRIENDLY_NAME` so that the media server is easily recognizable among the others you might have running on your network.  

### Start the application

Simply start the container using:

`docker-compose up -d`

Then open your favorite upnp control point, and enjoy.  
