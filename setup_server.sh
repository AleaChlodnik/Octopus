#!/bin/bash

apt-get update && apt-get install -y openssh-server python3 python3-pip sudo

export NEW_USER=aleachlodnik
useradd -ms /bin/bash ${NEW_USER}
echo "${NEW_USER}:azerty" | chpasswd
mkdir /home/${NEW_USER}/.ssh
cp /root/.ssh/authorized_keys /home/aleachlodnik/.ssh/authorized_keys
chown -R ${NEW_USER}:${NEW_USER} /home/${NEW_USER}/.ssh

#sudo
usermod -aG sudo ${NEW_USER}
echo "${NEW_USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers