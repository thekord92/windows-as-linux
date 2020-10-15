#!/bin/bash

#===WARNING=================================================================================================================

# !!! DO NOT RUN THIS BLINDLY !!! 
# !!! THESE ARE HINTS ONLY !!! 

#===Files===================================================================================================================

# Your keys are located in: /mnt/c/Users/$DEPLOYER/.ssh/
# Your private keys are named: id_rsa*.key
# Your public keys are named: id_rsa*.pub
# Your authorized_keys path: $HOME/.ssh/

#===Variables===============================================================================================================

# Export Variables
#
export DEPLOYER="$USER" # Try to have Windows and WSL usernames same
export FILESTORE="/mnt/c/Users/$DEPLOYER/Artifacts" # Just emulate Linux file tree for artifacts

#===WSL=====================================================================================================================

# Enable SUDO with NOPASSWD: sudo vi /etc/sudoers
# Edit Lines:
#
# %sudo   ALL=(ALL:ALL) NOPASSWD: ALL
#

# Configure SSH Home
#
mkdir -p /home/$DEPLOYER/.ssh
    chmod 700 /home/$DEPLOYER/.ssh
#
cp $FILESTORE/home/$DEPLOYER/.ssh/* /home/$DEPLOYER/.ssh/
    chmod 600 /home/$DEPLOYER/.ssh/id_rsa_*.key
    chmod 644 /home/$DEPLOYER/.ssh/id_rsa.pub
#

# Configure WSL Options:
#
sudo cat > /etc/wsl.conf <<-EOT
[automount]
enabled = true
options = "metadata,umask=22,fmask=11"
mountFsTab = false

[network]
generateHosts = true
generateResolvConf = true
EOT
#

# Reboot WSL in Administrative cmd.exe
#
net stop LxssManager
net start LxssManager
#

# Configure SSH Server: sudo vi /etc/ssh/sshd_config
# Edit Lines:
#
# Port 2222
# PasswordAuthentication yes # If do not want to use keys
#

# Enable SSH Server
#
sudo ssh-keygen -A
sudo service ssh --full-restart
#

# Fix Sleep (IF NEEDED!!!)
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

#===Prerequisites===========================================================================================================

# Install Prerequisites (not sure if all needed :-P )
#
sudo apt update
sudo apt upgrade
sudo apt install wget
#

#===========================================================================================================================
