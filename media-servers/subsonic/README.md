# Subsonic

## Description

A simple compose file you can use to create an instance of upmpdcli for the Subsonic Plugin.  
You will need to have a running subsonic server or an account on a publicly available one.  

## It's only a media server, not a renderer

Please note that this configuration only creates a media server. It does *not* create an UPnP renderer.  
If you need to create an UPnP renderer, have a look [here](https://github.com/GioF71/audio-tools/tree/main/players/upnp-renderer/upnp-renderer-simple).  

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
SUBSONIC_BASE_URL|Server url, example: `http://navidrome.local`
SUBSONIC_PORT|Server port, example: `4533`
SUBSONIC_USER|Your subsonic server username
SUBSONIC_PASSWORD|Your subsonic server password
SUBSONIC_LEGACYAUTH|Actually not mandatory, but some server (Lightweight Music Server) requires it to be set to `yes`

### Start the application

Simply start the container using:

`docker-compose up -d`

Then open your favorite upnp control point, and enjoy.  
