#!/bin/bash

exit 0

#===WARNING=================================================================================================================

# !!! DO NOT RUN THIS BLINDLY !!! 
# !!! THESE ARE HINTS ONLY !!! 

#===Git=====================================================================================================================

# Disable global Windows Git features (powershell):
#
git.exe config --global core.filemode false
git.exe config --global core.autocrlf false
git.exe config --global core.ignorecase true

# Unset repo Git features (bash):
#
git config --unset core.filemode
git config --unset core.autocrlf
git config --unset core.ignorecase

#===========================================================================================================================

