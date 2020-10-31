#!/bin/bash

exit 0

#===WARNING=================================================================================================================

# !!! DO NOT RUN THIS BLINDLY !!! 
# !!! THESE ARE HINTS ONLY !!! 

#===Ansible=================================================================================================================

#---------------------------------------------------------------------------------------------------------------------------
# !!!!!! Follow WSL.sh first !!!!!!
#---------------------------------------------------------------------------------------------------------------------------

# Export Variables
#
export PROJECT_NAME="windows-as-linux"
export USER_WSL="$USER" # Your Linux username
export USER_WIN="$(whoami.exe | cut -d '\' -f 2 | tr -d '\n' | tr -d '\r')" # Your Windows username
export HOME_WSL="$HOME" # Your Linux home
export HOME_WIN="/mnt/c/Users/$USER_WIN" # Your Windows home
export ARTIFACTS="$HOME_WIN/Artifacts/$PROJECT_NAME" # Copy Artifact examples here from repo
export DEPLOYER="$USER_WSL"
#

# Install ANSIBLE
#
sudo apt install ansible
#

# Clone Repo
#
mkdir -p $HOME_WIN/Learning/Projects
#
[ ! -d $HOME_WIN/Learning/Projects/$PROJECT_NAME ] && git -C $HOME_WIN/Learning/Projects clone https://github.com/arabadj/$PROJECT_NAME.git
[ -d $HOME_WIN/Learning/Projects/$PROJECT_NAME ] && git -C $HOME_WIN/Learning/Projects/$PROJECT_NAME pull 
#

# Fix Repo
#
cd $HOME_WIN/Learning/Projects/$PROJECT_NAME/
git config --unset core.filemode
git config --unset core.autocrlf
git config --unset core.ignorecase
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

