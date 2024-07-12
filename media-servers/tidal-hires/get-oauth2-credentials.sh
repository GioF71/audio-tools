#!/bin/bash

docker pull giof71/upmpdcli

echo "PUID=$(id -u)" >  .env
echo "PGID=$(id -u)" >> .env

docker run \
    -it \
    --rm \
    --env-file .env \
    --user "$PUID:$PGID" \
    --entrypoint /app/bin/get-tidal-credentials-oauth2.py \
    -v $(pwd)/cache/tidal:/tmp/generated \
    giof71/upmpdcli

