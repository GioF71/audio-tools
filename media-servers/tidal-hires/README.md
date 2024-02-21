# Upmpdcli Tidal Hires

## Description

This script and compose file will allow you to create a media server for Tidal, with support for HiRes lossless audio.  
A premium Tidal Account is required, particularly the HiFi Plus plan if you want to actually play hi-res.  

### Caveat

This is currently a **tech preview**.  
The upmpdcli plugin is not yet complete for hires support, and the [underlying library](https://github.com/tamland/python-tidal) does not have an official release with hires support. 

## Limitations

The only renderer know to be working with Tidal in hires mode with upmpdcli as the media server is the combination of mpd and upmpdcli (as a renderer).  
The limitation is due to the fact that the player must be able to play a `mpd manifest`.   

## Instructions

### Get the credentials

Clone this repository and move to the media-servers/tidal-hires directory (this directory).  
Execute the `get-pkce-credentials.sh` script, and follow the instructions.  
Read those instructions very carefully. It's actually a very simple process.  
You will have to click a link, authorize, and then paste the Oops url to the console and press ENTER.  
In order to run the script, use the following command, from this directory:

`./get-pkce-credentials.sh`

### Start the application

Simply start the container using:

`docker-compose up -d`

Then open your favorite upnp control point, and enjoy.  
