#!/bin/bash

exit 0

#===WARNING=================================================================================================================

# !!! DO NOT RUN THIS BLINDLY !!! 
# !!! THESE ARE HINTS ONLY !!! 

#===Git=====================================================================================================================

# Export Variables
#
# Export from: Project/environment.sh
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

#===========================================================================================================================

# Fix Windows Git (powershell, !!! LINE-BY-LINE !!!):
#
git.exe config --global core.filemode false
git.exe config --global core.autocrlf false
git.exe config --global core.ignorecase true
#

#===========================================================================================================================

