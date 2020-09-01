#!/bin/bash

#===WARNING=================================================================================================================

# !!! DO NOT RUN THIS BLINDLY !!! 
# !!! THESE ARE HINTS ONLY !!! 

#===Vagrant=================================================================================================================

# !!! Follow WSL.sh first !!!

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
cd ~
wget https://releases.hashicorp.com/vagrant/2.2.9/vagrant_2.2.9_x86_64.deb
sudo apt install ./vagrant_2.2.9_x86_64.deb
#

# !!! RUN VAGRANT PROJECTS FROM WINDOWS PROFILE PATHS ONLY !!!
# !!!   Like: /mnt/c/Users/user/Project                    !!!

#===========================================================================================================================

