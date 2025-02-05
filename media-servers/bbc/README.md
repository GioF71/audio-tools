# BBC Sounds

## Description

A simple compose file you can use to create an instance of upmpdcli for the BBC Sounds Plugin.  

## Links

Link|Description
:---|:--
[upmpdcli-docker](https://github.com/GioF71/upmpdcli-docker)|Docker container image for upmpdcli
[upmpdcli manual](https://www.lesbonscomptes.com/upmpdcli/pages/upmpdcli-manual.html)|Manual for upmpdcli
[upmpdcli bbc configuration manual](https://www.lesbonscomptes.com/upmpdcli/pages/upmpdcli-manual.html#_upmpdcli_bbc_sounds_plugin_parameters)|BBC Sounds section of the manual
[My repository for plugin development](https://github.com/GioF71/upmpdcli-plugins)|Mirror of upmpdcli on GitHub, for my plugin development activities

## It's only a media server by default

Please note that this configuration only creates a media server by default.
If you just need to create an UPnP renderer, have a look [here](https://github.com/GioF71/audio-tools/tree/main/players/upnp-renderer/upnp-renderer-simple).  
You can however enable the UPnP renderer on this configuration by setting RENDERER_MODE to `BOTH`, `OPENHOME` or `UPNPAV`.  
Follow the instructions in the sample.env file for additional tuning, end refer to the documentation for [this repository](https://github.com/GioF71/upmpdcli-docker).  
Please note, if you enable the UPnP renderer, you will need to have an instance of Music Player Daemon (MPD) running. Use MPD_HOST and MPD_PORT if this instance is not running on localhost at port 6600, the default values.  
Solutions like Moode Audio and Volumio run instances of mpd by default. Make sure that mpd is running on the default port `6600` on those solutions, or correct your `.env` file accordingly. YMMV.  
Without an instance of MPD running, the renderer won't work. If you don't have MPD running, you can create one using [this repository for a MPD docker image](https://github.com/GioF71/mpd-alsa-docker).  
Be careful, don't create more renderers than you need: it can get confusing quickly!  

## Instructions

### Create your Environment file

Simply copy the provided `sample.env` to `.env` using the following:

```text
cp sample.env .env
```

Edit the .env file with your editor of choice (maybe vscode over ssh?).  
A few variables are strictly required:

VARIABLE|Notes
:---|:---
BBC_PROGRAMME_DAYS|Programme days, see the plugin documentation

### Start the application

Simply start the container using:

`docker-compose up -d`

Then open your favorite upnp control point, and enjoy.  
