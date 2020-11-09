#!/bin/bash

exit 0

#===WARNING=================================================================================================================

# !!! DO NOT RUN THIS BLINDLY !!! 
# !!! THESE ARE HINTS ONLY !!! 

#===Ansible=================================================================================================================

# Export Variables
#
export PROJECT_NAME="windows-as-linux"
export SPACE="Labspace"
export USER_WSL="$USER" # Your Linux username
export USER_WIN="$(whoami.exe | cut -d '\' -f 2 | tr -d '\n' | tr -d '\r')" # Your Windows username
export HOME_WSL="$HOME" # Your Linux home
export HOME_WIN="/mnt/c/Users/$USER_WIN" # Your Windows home
export ARTIFACTS="$HOME_WIN/OneDrive/Artifacts/$SPACE" # Copy Artifact examples here from repo
export DEPLOYER="$USER_WSL" # Your deployment username
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

