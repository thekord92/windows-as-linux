#!/bin/bash

#===VARIABLES===============================================================================================================
export DEPLOYER="$USER" # Put your username here
#---------------------------------------------------------------------------------------------------------------------------
export CONFIGURE_ROOT="$PROJECT_ROOT/provisioning"
export FILESTORE="/mnt/c/Users/$DEPLOYER/Artifacts" # Copy Artifact examples here from repo
#---------------------------------------------------------------------------------------------------------------------------
export WSL_REMOTE_PORT="2222"
#---------------------------------------------------------------------------------------------------------------------------
export VAGRANT_HOSTNAME="vgr-project" # Set your vm name
export VAGRANT_ID="10" # ID is appended to sbnet and port
export VAGRANT_NETPREFIX_NAT="192.168.71"
export VAGRANT_NETPREFIX_PRIVATE="192.168.73" # Check with your "VirtualBox Host-Only Network" adapter subnet !!!
export VAGRANT_NETWORK_NAT="$VAGRANT_NETPREFIX_NAT.0/24"
export VAGRANT_NETWORK_PRIVATE="$VAGRANT_NETPREFIX_PRIVATE.$VAGRANT_ID"
export VAGRANT_SSH_PORT="22$VAGRANT_ID" # Do not edit
export VAGRANT_SSH_PRIVATE_KEY="/mnt/c/Users/$DEPLOYER/.ssh/id_rsa_vagrant.key"
export VAGRANT_SSH_PUBLIC_KEY="/mnt/c/Users/$DEPLOYER/.ssh/id_rsa_vagrant.pub"
export VAGRANT_SSH_INSECURE_KEY="/mnt/c/Users/$DEPLOYER/.vagrant.d/insecure_private_key" # Comes with Vagrant
#---------------------------------------------------------------------------------------------------------------------------
export ANSIBLE_DEPLOYER="$DEPLOYER"
export ANSIBLE_ACTION_WARNINGS="False"
export ANSIBLE_STDOUT_CALLBACK="yaml"
export ANSIBLE_LOAD_CALLBACK_PLUGINS="True"
export ANSIBLE_SSH_PIPELINING="True"
export ANSIBLE_HOST_PATTERN_MISMATCH="ignore"
export ANSIBLE_DISPLAY_SKIPPED_HOSTS="False"
#===========================================================================================================================
