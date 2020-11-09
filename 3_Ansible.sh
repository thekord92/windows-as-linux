#!/bin/bash

exit 0

#===WARNING=================================================================================================================

# !!! DO NOT RUN THIS BLINDLY !!! 
# !!! THESE ARE HINTS ONLY !!! 

#===Ansible=================================================================================================================

# Export Variables
#
# Export from: Project/environment.sh
#

# Install ANSIBLE
#
sudo apt install ansible
#

# Generate Artifacts from WSL (!!! IF DO NOT HAVE !!!)
#
cd $HOME_WIN/Learning/Projects/$PROJECT_NAME/Project && ./wsl-artifacfs.sh
#

# Configure WSL
#
cd $HOME_WIN/Learning/Projects/$PROJECT_NAME/Project && ./wsl-bootstrap.sh
cd $HOME_WIN/Learning/Projects/$PROJECT_NAME/Project && ./wsl-deplenv.sh
#

#===========================================================================================================================

