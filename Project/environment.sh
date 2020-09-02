#!/bin/bash

#===VARIABLES===============================================================================================================
export DEPLOYER="user"
#---------------------------------------------------------------------------------------------------------------------------
export CONFIGURE_ROOT="$PROJECT_ROOT/provisioning"
export FILESTORE="/mnt/c/Users/$DEPLOYER/Artifacts"
#---------------------------------------------------------------------------------------------------------------------------
export WSL_REMOTE_PORT="2222"
#---------------------------------------------------------------------------------------------------------------------------
export VAGRANT_HOSTNAME="vgr-project"
export VAGRANT_ID="10"
export VAGRANT_IP_ADDR="192.168.73.$VAGRANT_ID"
export VAGRANT_SSH_PORT="22$VAGRANT_ID"
export VAGRANT_SSH_PRIVATE_KEY="/mnt/c/Users/$DEPLOYER/.ssh/id_rsa_vagrant.key"
export VAGRANT_SSH_PUBLIC_KEY="/mnt/c/Users/$DEPLOYER/.ssh/id_rsa_vagrant.pub"
export VAGRANT_SSH_INSECURE_KEY="/mnt/c/Users/$DEPLOYER/.vagrant.d/insecure_private_key"
export VAGRANT_VMDK_WIN="C:/Users/$DEPLOYER/VirtualBox/$VAGRANT_HOSTNAME/box-disk001.vmdk"
export VAGRANT_VDI_WIN="C:/Users/$DEPLOYER/VirtualBox/$VAGRANT_HOSTNAME/box-disk001.vdi"
export VAGRANT_VDI_WSL="/mnt/c/Users/$DEPLOYER/VirtualBox/$VAGRANT_HOSTNAME/box-disk001.vdi"
#---------------------------------------------------------------------------------------------------------------------------
export ANSIBLE_DEPLOYER="$DEPLOYER"
export ANSIBLE_ACTION_WARNINGS="False"
export ANSIBLE_STDOUT_CALLBACK="yaml"
export ANSIBLE_LOAD_CALLBACK_PLUGINS="True"
export ANSIBLE_SSH_PIPELINING="True"
export ANSIBLE_HOST_PATTERN_MISMATCH="ignore"
export ANSIBLE_DISPLAY_SKIPPED_HOSTS="False"
#===========================================================================================================================
