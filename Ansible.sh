#!/bin/bash

#===WARNING=================================================================================================================

# !!! DO NOT RUN THIS BLINDLY !!! 
# !!! THESE ARE HINTS ONLY !!! 

#===Ansible=================================================================================================================

# !!! Do WSL.sh first !!!

# Make Sleep Always TRUE
#
# Do this if want to configure your WSL with Ansible
[ ! -L "/usr/bin/sleep" ] && [ ! -f "/usr/bin/sleep.bak" ] && sudo mv /usr/bin/sleep /usr/bin/sleep.bak && \
    echo "Renamed /usr/bin/sleep"
[ ! -L "/usr/bin/sleep" ] && [sudo ln -s /bin/true /usr/bin/sleep
#

# Install ANSIBLE
#
sudo apt install ansible
#

#===========================================================================================================================

