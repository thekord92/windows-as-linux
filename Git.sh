#!/bin/bash

exit 0

#===WARNING=================================================================================================================

# !!! DO NOT RUN THIS BLINDLY !!! 
# !!! THESE ARE HINTS ONLY !!! 

#===Git=====================================================================================================================

# Disable global Windows Git features:
#
git.exe config --global core.filemode false
git.exe config --global core.autocrlf false

# Unset repo Git features:
#
git config --unset core.filemode

#===========================================================================================================================

