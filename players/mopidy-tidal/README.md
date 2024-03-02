# Mopidy

## Description

This compose file will allows you to create a mopidy instance for Tidal, with support for HiRes lossless audio.  
A premium Tidal Account is required, particularly the HiFi Plus plan if you want to actually play hi-res.  

## References

This is possible because of these awesome projects:

[Mopidy-Tidal](https://github.com/tehkillerbee/mopidy-tidal) by [tehkillerbee](https://github.com/tehkillerbee)  
[Python-tidal](https://github.com/tehkillerbee/python-tidal) by [tamland](https://github.com/tamland), now maintained by [tehkillerbee](https://github.com/tehkillerbee)  

We will be using my [docker image for mopidy](https://github.com/GioF71/mopidy-docker) which I built with this use case in mind.  

## Instructions

### Create you own env file

Copy the sample.env file to a new .env file:

cp sample.env .env

Edit the file with the favorite editor, set the parameters.

### Start the application

Simply start the container using:

`docker-compose up -d`

In order to authenticate, open your browse at the <http://your-host:8989> and follow the instructions.  
Then open your browser at the <http://your-host:6680>, and enjoy.  
Remember to change the ports in the url according to the values you might have set in your custom .env file.  
