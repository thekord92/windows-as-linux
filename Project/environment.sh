#!/bin/bash

#===VARIABLES===============================================================================================================
export PROJECT_NAME="windows-as-linux"
export USER_WSL="$USER" # Your Linux username
export USER_WIN="$(whoami.exe | cut -d '\' -f 2 | tr -d '\n' | tr -d '\r')" # Your Windows username
export HOME_WSL="$HOME" # Your Linux home
export HOME_WIN="/mnt/c/Users/$USER_WIN" # Your Windows home
export ARTIFACTS="$HOME_WIN/Artifacts/$PROJECT_NAME" # Copy Artifact examples here from repo
export DEPLOYER="$USER_WSL"
#---------------------------------------------------------------------------------------------------------------------------
export CONFIGURE_ROOT="$PROJECT_ROOT/provisioning"
#---------------------------------------------------------------------------------------------------------------------------
export WSL_REMOTE_PORT="2222"
#---------------------------------------------------------------------------------------------------------------------------
export VAGRANT_HOSTNAME="vgr-wal" # Set your vm name
export VAGRANT_ID="10" # ID is appended to sbnet and port
export VAGRANT_NETPREFIX_NAT="192.168.71"
export VAGRANT_NETPREFIX_PRIVATE="192.168.73" # Check with your "VirtualBox Host-Only Network" adapter subnet !!!
export VAGRANT_NETWORK_NAT="$VAGRANT_NETPREFIX_NAT.0/24"
export VAGRANT_NETWORK_PRIVATE="$VAGRANT_NETPREFIX_PRIVATE.$VAGRANT_ID"
export VAGRANT_SSH_PORT="22$VAGRANT_ID" # Do not edit
export VAGRANT_SSH_PRIVATE_KEY="$HOME_WIN/.ssh/id_rsa_vagrant.key"
export VAGRANT_SSH_PUBLIC_KEY="$HOME_WIN/.ssh/id_rsa_vagrant.pub"
export VAGRANT_SSH_INSECURE_KEY="$HOME_WIN/.vagrant.d/insecure_private_key" # Comes with Vagrant
#---------------------------------------------------------------------------------------------------------------------------
export ANSIBLE_DEPLOYER="$DEPLOYER"
export ANSIBLE_ACTION_WARNINGS="False"
export ANSIBLE_STDOUT_CALLBACK="yaml"
export ANSIBLE_LOAD_CALLBACK_PLUGINS="True"
export ANSIBLE_SSH_PIPELINING="True"
export ANSIBLE_HOST_PATTERN_MISMATCH="ignore"
export ANSIBLE_DISPLAY_SKIPPED_HOSTS="False"
#===========================================================================================================================
