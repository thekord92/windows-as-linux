#!/bin/bash

#===WARNING=================================================================================================================

# !!! DO NOT RUN THIS BLINDLY !!! 
# !!! THESE ARE HINTS ONLY !!! 

#===Variables===============================================================================================================

# Export Variables
#
export DEPLOYER="user" # Try to have Windows and WSL usernames same
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
cp $FILESTORE/home/$DEPLOYER/.ssh/id_rsa_$DEPLOYER.pub /home/$DEPLOYER/.ssh/
    chmod 600 /home/$DEPLOYER/.ssh/id_rsa
cp $FILESTORE/home/$DEPLOYER/.ssh/id_rsa_$DEPLOYER.pub /home/$DEPLOYER/.ssh/
    chmod 644 /home/$DEPLOYER/.ssh/id_rsa.pub
cp $FILESTORE/home/$DEPLOYER/.ssh/authorized_keys /home/$DEPLOYER/.ssh/
    chmod 644 /home/$DEPLOYER/.ssh/authorized_keys
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
# PasswordAuthentication yes
#

# Enable SSH Server
#
sudo ssh-keygen -A
sudo service ssh --full-restart
#

# !!! MANAGE SSHD AFTER, ON YOUR OWN !!!

#===Prerequisites===========================================================================================================

# Install Prerequisites (not sure if all needed :-P )
#
sudo apt update
sudo apt upgrade
sudo apt install wget
#

#===========================================================================================================================

