# Qobuz

## Description

A simple compose file you can use to create an instance of upmpdcli for the Qobuz Plugin.  
A premium Qobuz Account is required.  

## Instructions

### Set the credentials

#### Environment file

You can create you .env file and store your credentials there. The format is:

```text
QOBUZ_USERNAME=your-username
QOBUZ_PASSWORD=your-password
QOBUZ_FORMAT_ID=27
```

#### Custom file in the userconfig folder

Alternatively, you can save a file with the same structure as in the previous paragraph in the userconfig folder, and name it `qobuz.txt`.  

#### Custom path for userconfig volume

Alternatively, you can define the path mapped to the volume `/user/config` using the optional variable `USER_CONFIG_PATH` to an existing path, which should contain the `qobuz.txt` file.

### Start the application

Simply start the container using:

`docker-compose up -d`

Then open your favorite upnp control point, and enjoy.  
