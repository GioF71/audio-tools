# Upmpdcli Media Library

## Description

This script and compose file will allow you to create a media server for your local files.  

## Links

Link|Description
:---|:--
[upmpdcli-docker](https://github.com/GioF71/upmpdcli-docker)|Docker container image for upmpdcli
[upmpdcli manual](https://www.lesbonscomptes.com/upmpdcli/pages/upmpdcli-manual.html)|Manual for upmpdcli

## Instructions

### Tune your settings

This is not mandatory, but you can copy the provided `sample.env` to your own `.env` file.  
Copy the file:

```text
cp sample.env .env
```

Edit you `.env` file, instructions and options are in the file itself.

### Start the application

Simply start the container using:

`docker-compose up -d`

Then open your favorite upnp control point, and enjoy.  
