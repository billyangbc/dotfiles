#!/usr/bin/env bash

# Installs ansible on debian
#sudo apt-get update && sudo apt-get install -y ansible
#sudo apt-get install -y sshpass

# preset file contains private settings which should not goto public
PRESET="preset"
# if the extra file exist, source it
if [ -e $PRESET ]; then
    source $PRESET
fi

# Dotfiles' project root directory
ROOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Host file location
HOSTS="$ROOTDIR/hosts"
# Main playbook
PLAYBOOK="$ROOTDIR/dotfiles.yml"

# Runs Ansible playbook using our user.
#ansible-playbook -i "$HOSTS" "$PLAYBOOK"
if [ "$#" -eq 0 ]; then          
    ansible-playbook -i "$HOSTS" "$PLAYBOOK" --extra-vars "ansible_user=$DOTFILES_USER" --ask-pass --ask-become-pass
else
    host="$1"
    ansible-playbook -i "$HOSTS" "$PLAYBOOK" --extra-vars "ansible_user=$DOTFILES_USER" --ask-pass --ask-become-pass --limit "$host"
fi

exit 0

## usage:
# ./bootstrap.sh
# ./bootstrap.sh 192.168.0.201