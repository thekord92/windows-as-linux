#!/bin/bash

#===WARNING=================================================================================================================

# !!! DO NOT RUN THIS BLINDLY !!! 
# !!! THESE ARE HINTS ONLY !!! 

#===Ansible=================================================================================================================

# !!! Follow WSL.sh first !!!

# Make Sleep Always TRUE
#
# Do this if want to configure your WSL with Ansible
[ ! -L "/usr/bin/sleep" ] && [ ! -f "/usr/bin/sleep.bak" ] && sudo mv /usr/bin/sleep /usr/bin/sleep.bak 
[ ! -L "/usr/bin/sleep" ] && sudo ln -s /bin/true /usr/bin/sleep
#

# Install ANSIBLE
#
sudo apt install ansible
#

#===========================================================================================================================

