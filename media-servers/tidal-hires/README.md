# Upmpdcli Tidal Hires

## Description

This script and compose file will allow you to create a media server for Tidal, with support for HiRes lossless audio.  
A premium Tidal Account is required.  
By default, we will be using the `next-tidal` branch so we have the latest version `0.8.0` (or greater) of the plugin, because since this version we are finally back to a simple authentication process.  

## It's only a media server by default

Please note that this configuration only creates a media server by default.
If you just need to create an UPnP renderer, have a look [here](https://github.com/GioF71/audio-tools/tree/main/players/upnp-renderer/upnp-renderer-simple).  
You can however enable the UPnP renderer on this configuration by setting RENDERER_MODE to `BOTH`, `OPENHOME` or `UPNPAV`.  
Follow the instructions in the sample.env file for additional tuning, and eventually refer to the documentation for [this repository](https://github.com/GioF71/upmpdcli-docker).  
Please note, if you enable the UPnP renderer, you will need to have an instance of Music Player Daemon (MPD) running. Use MPD_HOST and MPD_PORT if this instance is not running on localhost at port 6600, the default values.  
Solutions like Moode Audio and Volumio run instances of mpd by default. Make sure that mpd is running on the default port `6600` on those solutions, or correct your `.env` file accordingly. YMMV.  
Without an instance of MPD running, the renderer won't work. If you don't have MPD running, you can create one using [this repository for a MPD docker image](https://github.com/GioF71/mpd-alsa-docker).  
Be careful, don't create more renderers than you need: it can get confusing quickly!  

## A control point is required

In order to access the media server, you will need to run a control point application: look [here](https://en.wikipedia.org/wiki/List_of_UPnP_AV_media_servers_and_clients#UPnP_control_points_and_player_software) for a list of choices.  
My personal preference goes to [upplay](https://www.lesbonscomptes.com/upplay/index.html) on Linux, MacOS and Windows and to [BubbleUPnP for DLNA/Chromecast](https://play.google.com/store/apps/details?id=com.bubblesoft.android.bubbleupnp&hl=en) for Android devices.  
Honorable mention for mConnect player lite, available for both [Android](https://play.google.com/store/apps/details?id=com.conversdigital&hl=en) and [iOS](https://apps.apple.com/it/app/mconnect-player-lite/id507379024).  

## Limitations

The only renderers know to be working with Tidal in hires mode (so using the variable `TIDAL_AUDIO_QUALITY` set to `HI_RES_LOSSLESS`) with upmpdcli as the media server are:

- the combination of mpd and upmpdcli (as a renderer) [docker images [here](https://github.com/GioF71/mpd-alsa-docker) and [here](https://github.com/GioF71/upmpdcli-docker))
- [gmrender-resurrect](https://github.com/hzeller/gmrender-resurrect), docker image ([here](https://github.com/GioF71/gmrender-resurrect-docker))
  
The limitation is due to the fact that the player must be able to play a `mpd manifest`.  
Other players (Kodi, WiiM, etc.) will be automatically served a lower quality stream (lossless 16/44): still an excellent quality.  

## Instructions

### Tune your settings

This is not mandatory, but you can copy the provided `sample.env` to your own `.env` file.  
Copy the file:

```text
cp sample.env .env
```

Edit you `.env` file, instructions and options are in the file itself.  
Carefully configure the `TIDAL_AUDIO_QUALITY`, according to the authentication type for which you have created the credentials file.  
Also tune `FRIENDLY_NAME` so that the media server is easily recognizable among the others you might have running on your network.  

### Get the credentials

#### Interactively

Since version `0.7.6` of the Tidal plugin, we can monitor the container log and simply follow a link and authenticate in order to obtain a set of credentials for Tidal.  
Run the container using the following command:

`docker-compose up -d && docker-compose logs -f`

Wait for the container to start, then go to the control point and try to navigate the media server.  
You will presented with a url with instructions. Open the link in your browser, authenticate to Tidal if needed, then authorize the request.  
The container should now be fully functional, you can access it from your control point.  
If you run an application like [Portainer](https://www.portainer.io/) or similar, you can avoid to use the command line, you just need to look at the container logs.  

#### Using the script

If you don't want to obtain the credentials interactively, you can instead execute the get_credentials.py script.  
The container must be running, so if it is not, run it using:

`docker-compose up -d`

After that, launch the script using the following command:

`docker-compose exec upmpdcli sh -c 'su - $(id -u -n $PUID) -c "/usr/share/upmpdcli/cdplugins/tidal/get_credentials.py -f /cache/tidal/oauth2.credentials.json"'`

Follow the on-screen instruction. You will have to copy the URL to your browser, authenticate to Tidal if needed, and authorize the request.  
After this operation, the container should be fully functional, and you will be able to access the contents from your control point.  

#### Caveat

If both `oauth2.credentials.json` and `pkce.credentials.json` credentials file are available, upmpdcli will use `oauth2.credentials.json` by default.  
The `pkce.credentials.json` is still currently supported as a legacy feature and will probably be removed in the future.  

### Start the application

Simply start the container using:

`docker-compose up -d`

Then open your favorite upnp control point, and enjoy.  
