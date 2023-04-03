#!/bin/bash

declare -A config

function load_config() {
    echo "Loading config..."
    while IFS= read -r line
    do
        if [[ -n "$line" && ! $line = \#* ]]; then
            key="$(cut -d '=' -f1 <<< ${line})"
            keyLen=`echo ${#key}`
            value=${line#*=} 
            echo "Loading preset [$key]=[$value]"
            config[$key]=$value
    fi
    done < "$1"
    echo "Finished loading config"
}

