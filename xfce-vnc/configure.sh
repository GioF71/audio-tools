#!/bin/bash

source ../util/load_config.sh

load_config .config

echo "Creating vnc directory"
mkdir -p ${HOME}/.vnc

# TODO password must be parametric
if [ -f "${HOME}/.vnc/passwd" ]; then
  echo "Removing vnc passwd file"
  rm ${HOME}/.vnc/passwd
fi

VNC_PASSWORD="${config[VNC_PASSWORD]}"
if [ -z "${VNC_PASSWORD}" ]; then
  VNC_PASSWORD=password
fi
echo "VNC_PASSWORD=${VNC_PASSWORD}"

echo "Updating vnc password file"
echo $VNC_PASSWORD | vncpasswd -f > "${HOME}/.vnc/passwd"
chmod 0600 "${HOME}/.vnc/passwd"
cat ${HOME}/.vnc/passwd


echo "Creating xstartup file..."
mkdir -p ${HOME}/.vnc
chmod 700 $HOME/.vnc
#prepare xstartup
echo "#!/bin/bash" > ${HOME}/.vnc/xstartup
echo "xrdb ${HOME}/.Xresources" >> ${HOME}/.vnc/xstartup
echo "startxfce4 &" >> $HOME/.vnc/xstartup
chmod 755 ${HOME}/.vnc/xstartup

