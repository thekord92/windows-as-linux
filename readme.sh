#!/bin/bash

#===WARNING=================================================================================================================

# !!! DO NOT RUN THIS BLINDLY !!! 
# !!! THESE ARE HINTS ONLY !!! 

#===Variables===============================================================================================================

# Export Variables
#
export DEPLOYER="user"
export FILESTORE="/mnt/c/Users/$DEPLOYER/Deployment/Linux" # Just an Artifacts Directory

#===WSL=====================================================================================================================

# Enable SUDO with NOPASSWD: sudo vi /etc/sudoers
# Edit Lines:
#
# %sudo   ALL=(ALL:ALL) NOPASSWD: ALL

# Create Directories
#
mkdir -p /home/$DEPLOYER/.ssh
sudo chmod 700 /home/$DEPLOYER/.ssh

# Copy and Secure Files
#
cp $FILESTORE/.ssh/* /home/$DEPLOYER/.ssh/
sudo chmod 644 /home/$DEPLOYER/.ssh/*
sudo chmod 600 /home/$DEPLOYER/.ssh/id_rsa

# Logoff/Login or Get NEW BASH
#
/bin/bash

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

# Reboot WSL in Administrative cmd.exe
#
net stop LxssManager
net start LxssManager

# Configure SSH Server: sudo vi /etc/ssh/sshd_config
# Edit Lines:
#
# Port 2222
# PasswordAuthentication yes

# Enable SSH Server
#
sudo ssh-keygen -A
sudo service ssh --full-restart

# !!! MANAGE SSHD AFTER, ON YOUR OWN !!!

#===Prerequisites===========================================================================================================

# Install Prerequisites (not sure if all needed :-P )
#
sudo apt update
sudo apt upgrade
sudo apt install wget

#===Ansible=================================================================================================================

# Make Sleep Always TRUE
#
[ ! -L "/usr/bin/sleep" ] && [ ! -f "/usr/bin/sleep.bak" ] && sudo mv /usr/bin/sleep /usr/bin/sleep.bak && echo "Renamed /usr/bin/sleep"
[ ! -L "/usr/bin/sleep" ] && [sudo ln -s /bin/true /usr/bin/sleep

# Install ANSIBLE
#
sudo apt install ansible

#===Vagrant=================================================================================================================

# Add Vagrant Variable: vi ~/.bashrc
#
# export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"

# Logoff/Login or Get NEW BASH
#
/bin/bash

# Install Vagrant
#
cd ~
wget https://releases.hashicorp.com/vagrant/2.2.9/vagrant_2.2.9_x86_64.deb
sudo apt install ./vagrant_2.2.9_x86_64.deb

# !!! RUN VAGRANT PROJECTS FROM WINDOWS PROFILE PATHS ONLY !!!
# !!!   Like: /mnt/c/Users/user/Project                    !!!

#===========================================================================================================================

