#!/bin/bash

exit 0

#===WARNING=================================================================================================================

# !!! DO NOT RUN THIS BLINDLY !!! 
# !!! THESE ARE HINTS ONLY !!! 

#===Files===================================================================================================================

# Your keys are located in: /mnt/c/Users/$DEPLOYER/.ssh/ and /home/$DEPLOYER/.ssh/
# Your private keys are named: id_rsa*.key
# Your public keys are named: id_rsa*.pub
# Your authorized_keys path: /mnt/c/Users/$DEPLOYER/.ssh/$HOME/.ssh/ and /home/$DEPLOYER/.ssh/

#===Variables===============================================================================================================

# Export Variables
#
export USER_WSL="$USER" # Your Linux username
export USER_WIN="$(whoami.exe | cut -d '\' -f 2 | tr -d '\n' | tr -d '\r')" # Your Windows username
export HOME_WSL="$HOME" # Your Linux home
export HOME_WIN="/mnt/c/Users/$USER_WIN" # Your Windows home
export ARTIFACTS="$HOME_WIN/Artifacts" # Copy Artifact examples here from repo
export DEPLOYER="$USER_WSL"

#===Vagrant=================================================================================================================

#---------------------------------------------------------------------------------------------------------------------------
# !!!!!! Follow WSL.sh first !!!!!!
#---------------------------------------------------------------------------------------------------------------------------

# Create SSH Key Pair for Vagrant
#
ssh-keygen -f /mnt/c/Users/$DEPLOYER/.ssh/id_rsa_vagrant -C "user@domain.com" # No Password
mv /mnt/c/Users/$DEPLOYER/.ssh/id_rsa_vagrant /mnt/c/Users/$DEPLOYER/.ssh/id_rsa_vagrant.key
chmod 644 /mnt/c/Users/$DEPLOYER/.ssh/id_rsa_vagrant.pub
chmod 600 /mnt/c/Users/$DEPLOYER/.ssh/id_rsa_vagrant.key

# Add Vagrant Variable: vi ~/.bashrc
#
# export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
#

# Logoff/Login or Get NEW BASH
#
/bin/bash
#

# Install Vagrant
#
# If you are done with wsl-deplenv.sh Vagrant packge is already downloaded
# Skip this and just run: sudo apt install ~/install/vagrant_2.2.9_x86_64.deb
cd ~
wget https://releases.hashicorp.com/vagrant/2.2.9/vagrant_2.2.9_x86_64.deb
sudo apt install ./vagrant_2.2.9_x86_64.deb
#

# !!! RUN VAGRANT PROJECTS FROM WINDOWS PROFILE PATHS ONLY !!!
# !!!   Like: /mnt/c/Users/user/Project                    !!!

#---------------------------------------------------------------------------------------------------------------------------
# Now you can run vagrant-* provisioning scripts
#---------------------------------------------------------------------------------------------------------------------------

#===========================================================================================================================

