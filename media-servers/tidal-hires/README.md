# Upmpdcli Tidal Hires

## Description

This script and compose file will allow you to create a media server for Tidal, with support for HiRes lossless audio.  
A premium Tidal Account is required.  
By default, we will be using the `next-tidal` branch so we have version `0.7.5` of the plugin, because since this version we are finally back to a simple authentication process.  

## It's only a media server by default

Please note that this configuration only creates a media server by default.
If you just need to create an UPnP renderer, have a look [here](https://github.com/GioF71/audio-tools/tree/main/players/upnp-renderer/upnp-renderer-simple).  
You can however enable the UPnP renderer on this configuration by setting RENDERER_MODE to `BOTH`, `OPENHOME` or `UPNPAV`.  
Follow the instructions in the sample.env file for additional tuning, and eventually refer to the documentation for [this repository](https://github.com/GioF71/upmpdcli-docker).  
Please note, if you enable the UPnP renderer, you will need to have an instance of Music Player Daemon (MPD) running. Use MPD_HOST and MPD_PORT if this instance is not running on localhost at port 6600, the default values.  
Solutions like Moode Audio and Volumio run instances of mpd by default. Make sure that mpd is running on the default port `6600` on those solutions, or correct your `.env` file accordingly. YMMV.  
Without an instance of MPD running, the renderer won't work. If you don't have MPD running, you can create one using [this repository for a MPD docker image](https://github.com/GioF71/mpd-alsa-docker).  
Be careful, don't create more renderers than you need: it can get confusing quickly!  

## Limitations

The only renderers know to be working with Tidal in hires mode (so using the variable `TIDAL_AUDIO_QUALITY` set to `HI_RES_LOSSLESS`) with upmpdcli as the media server are:

- the combination of mpd and upmpdcli (as a renderer) [docker images [here](https://github.com/GioF71/mpd-alsa-docker) and [here](https://github.com/GioF71/upmpdcli-docker))
- [gmrender-resurrect](https://github.com/hzeller/gmrender-resurrect), docker image ([here](https://github.com/GioF71/gmrender-resurrect-docker))
  
The limitation is due to the fact that the player must be able to play a `mpd manifest`.  
When using the lower quality modes, almost every UPnP/DLNA player should be able to stream correctly.

## Instructions

### Get the credentials

Since version 0.7.5 of the Tidal plugin, we can monitor the container log and simply follow a link and authenticate in order to obtain a set of credentials for Tidal.  
Run the container using the following command:

`docker-compose up -d && docker-compose logs -f`

Wait for the container to start, then go to the control point and try to navigate the media server.  
You will presented with a url with instructions. Open the link in your browser, authenticate to Tidal if needed, then authorize the request.  
The container should now be fully functional, you can access it from your control point.  

#### Caveat

If you generate both credentials file, upmpdcli will use the pkce version by default. If you don't want this and want to use the regular (oauth2) version of the credentials, just delete the file `pkce.credentials.json` from the `cache/tidal` directory.

### Tune your settings

This is not mandatory, but you can copy the provided `sample.env` to your own `.env` file.  
Copy the file:

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
