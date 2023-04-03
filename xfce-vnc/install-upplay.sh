#/bin/bash

set -e

REPO_KEY="/etc/apt/sources.list.d/upmpdcli-bullseye.list"
if [ ! -f "${REPO_KEY}" ]; then
  echo "Downloading repo key ..."
  sudo wget https://www.lesbonscomptes.com/pages/lesbonscomptes.gpg -O "${REPO_KEY}"
  echo "Repo key downloaded"
else
  echo "Repo key already available"
fi

declare -A repo_url_dict

REPO_X86_64="https://www.lesbonscomptes.com/upmpdcli/pages/upmpdcli-bullseye.list"
REPO_ARM="https://www.lesbonscomptes.com/upmpdcli/pages/upmpdcli-rbullseye.list"

repo_url_dict[x86_64]=$REPO_X86_64
repo_url_dict[armv7l]=$REPO_ARM
repo_url_dict[aarch64]=$REPO_ARM

ARCH=`uname -m`
REPO_URL=${repo_url_dict["${ARCH}"]};

REPO_LIST="/etc/apt/sources.list.d/upmpdcli-bullseye.list"
if [ ! -f "${REPO_LIST}" ]; then
  echo "Downloading source list"
  sudo wget $REPO_URL -O "${REPO_LIST}"
  echo "Source list downloaded"
else
  echo "Source list already available"
fi

sudo apt-get update

sudo apt-get install -y upplay

