#!/bin/bash

exit 0

#===WARNING=================================================================================================================

# !!! DO NOT RUN THIS BLINDLY !!! 
# !!! THESE ARE HINTS ONLY !!! 

#===Files===================================================================================================================

# Your private keys are named: id_rsa*.key
# Your public keys are named: id_rsa*.pub

#===WSL=====================================================================================================================

# Export Variables
#
export PROJECT_NAME="windows-as-linux"
export USER_WSL="$USER" # Your Linux username
export USER_WIN="$(whoami.exe | cut -d '\' -f 2 | tr -d '\n' | tr -d '\r')" # Your Windows username
export HOME_WSL="$HOME" # Your Linux home
export HOME_WIN="/mnt/c/Users/$USER_WIN" # Your Windows home
export ARTIFACTS="$HOME_WIN/Artifacts/$PROJECT_NAME" # Copy Artifact examples here from repo
export DEPLOYER="$USER_WSL"
#

# Enable SUDO with NOPASSWD: sudo vi /etc/sudoers
# Edit Lines:
#
# %sudo   ALL=(ALL:ALL) NOPASSWD: ALL
#

# Configure WSL Options:
#
sudo su -
cat > /etc/wsl.conf <<-EOT
[automount]
enabled = true
options = "metadata,umask=22,fmask=11"
mountFsTab = false

[network]
generateHosts = true
generateResolvConf = true
EOT
exit
#

# Terminate and Open WSL again
#
wsl.exe -t Ubuntu
#

#---------------------------------------------------------------------------------------------------------------------------

# !!! EXPORT VARIABLES AGAIN !!!

# Update and Install Prerequisites
#
sudo apt update
sudo apt upgrade
#
sudo apt install wget
sudo apt install git
#

# Configure SSH (if have your keys in Windows SSH Home)
#
mkdir -p $HOME_WSL/.ssh && chmod 700 $HOME_WSL/.ssh
cp $HOME_WIN/.ssh/id_rsa_*.pub $HOME_WSL/.ssh/ && chmod 644 $HOME_WSL/.ssh/id_rsa_*.pub
cp $HOME_WIN/.ssh/id_rsa_*.key $HOME_WSL/.ssh/ && chmod 600 $HOME_WSL/.ssh/id_rsa_*.key
cat $HOME_WSL/.ssh/id_rsa_$USER_WSL.pub > $HOME_WSL/.ssh/authorized_keys
#

# Configure SSH (if do not have your keys)
#
ssh-keygen -t rsa -b 2048 -f $HOME_WSL/.ssh/id_rsa_$USER_WSL -C "$USER_WSL@company.com"
#
mv $HOME_WSL/.ssh/id_rsa_$USER_WSL $HOME_WSL/.ssh/id_rsa_$USER_WSL.key
cat $HOME_WSL/.ssh/id_rsa_$USER_WSL.pub > $HOME_WSL/.ssh/authorized_keys
#

# Configure SSH Server: sudo vi /etc/ssh/sshd_config
# Edit and uncomment ines:
#
# Port 2222
# PasswordAuthentication yes # If do not want to use keys
#

# Enable SSH Server
#
sudo ssh-keygen -A
sudo service ssh --full-restart
#

# Install SSH Keys loader (optional)
#
mkdir -p $HOME_WSL/.local/gbin
wget -P $HOME_WSL/.local/gbin/ https://raw.githubusercontent.com/arabadj/public-scripts/main/ssh-load-linux
wget -P $HOME_WSL/.local/gbin/ https://raw.githubusercontent.com/arabadj/public-scripts/main/ssh-load-windows
chmod +x $HOME_WSL/.local/gbin/ssh-load-*
#
$HOME_WSL/.local/gbin/ssh-load-linux install
bash

# Fix Sleep (DO NOT DO FOR "Ubuntu" RELEASE)
#
# Do this if want to configure your WSL with Ansible
[ ! -L "/usr/bin/sleep" ] && [ ! -f "/usr/bin/sleep.bak" ] && sudo mv /usr/bin/sleep /usr/bin/sleep.bak 
#
# Option 1
[ ! -L "/usr/bin/sleep" ] && sudo ln -s /bin/true /usr/bin/sleep
# Option 2
sudo cat > /usr/bin/sleep <<-EOT
#!/usr/bin/env python3

import sys
import time

try:
    time.sleep(int(sys.argv[1]))
except:
    quit()
EOT
chmod +x /usr/bin/sleep
#

#===========================================================================================================================
