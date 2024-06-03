# upnp-renderer-user-mode

## Configure

You can copy the provided `sample.env` to your own `.env` file.  
Copy the file:

```text
cp sample.env .env
```

Edit you `.env` file, instructions and options are in the file itself.

## First Run for Yams

Yams must be configured using an initial `docker-compose run` command.  
Enter the following:

```text
docker-compose run yams
```

You will receive a prompt similar to the following:

```text
2024-06-03 17:21:37,720 - yams - INFO - Attempting new authentication...
2024-06-03 17:21:37,875 - yams - INFO - Token received, navigate to http://www.last.fm/api/auth/?api_key=api_redacted&token=token_redacted to authenticate...
```

Navigate to the url, login if necessary, and authorize the app. Then press ENTER on the terminal.  

## Final step

After doing this, you can stop the container with a CTRL-C, and run the stack as usual with the following command:

```text
docker-compose up -d
```
