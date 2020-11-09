#!/bin/bash

exit 0

#===WARNING=================================================================================================================

# !!! DO NOT RUN THIS BLINDLY !!! 
# !!! THESE ARE HINTS ONLY !!! 

#===Vagrant=================================================================================================================

# Export Variables
#
# Export from: Project/environment.sh
#

# Create SSH Key Pair for Vagrant
#
mkdir -p $HOME_WIN/.ssh
ssh-keygen -f $HOME_WIN/.ssh/id_rsa_vagrant -C "vagrant@domain.com" # No Password
mv $HOME_WIN/.ssh/id_rsa_vagrant $HOME_WIN/.ssh/id_rsa_vagrant.key
chmod 644 $HOME_WIN/.ssh/id_rsa_vagrant.pub
chmod 600 $HOME_WIN/.ssh/id_rsa_vagrant.key
#

# Install Vagrant
#
cd $HOME_WSL/install && sudo apt install ./vagrant_2.2.9_x86_64.deb
#

# Boot VM
#
cd $HOME_WIN/Learning/Projects/$PROJECT_NAME/Project && ./vagrant-up.sh


# !!! RUN VAGRANT PROJECTS FROM WINDOWS PROFILE PATHS ONLY !!!
# !!!   Like: /mnt/c/Users/user/Project                    !!!

#---------------------------------------------------------------------------------------------------------------------------
# Now you can run vagrant-* provisioning scripts
#---------------------------------------------------------------------------------------------------------------------------

#===========================================================================================================================

