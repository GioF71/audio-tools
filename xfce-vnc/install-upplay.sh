#!/bin/bash

set -e

REPO_KEY="/usr/share/keyrings/lesbonscomptes.gpg"
echo "Downloading repo key ..."
sudo wget -O $REPO_KEY https://www.lesbonscomptes.com/pages/lesbonscomptes.gpg
echo "Repo key downloaded"

declare -A repo_url_dict

REPO_X86_64="https://www.lesbonscomptes.com/upmpdcli/pages/upmpdcli-bullseye.list"
REPO_ARM="https://www.lesbonscomptes.com/upmpdcli/pages/upmpdcli-rbullseye.list"

repo_url_dict[x86_64]=$REPO_X86_64
repo_url_dict[armv7l]=$REPO_ARM
repo_url_dict[aarch64]=$REPO_ARM

ARCH=`uname -m`
REPO_URL=${repo_url_dict["${ARCH}"]};

REPO_LIST="/etc/apt/sources.list.d/upmpdcli-bullseye.list"
echo "Downloading source list [${REPO_URL}]"
sudo wget -O ${REPO_LIST} ${REPO_URL}
echo "Source list downloaded"

sudo apt-get update

sudo apt-get install -y upplay

