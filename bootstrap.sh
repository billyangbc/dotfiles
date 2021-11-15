#!/usr/bin/env bash

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

# Installs ansible
sudo apt-get update && sudo apt-get install -y ansible


# Runs Ansible playbook using our user.
ansible-playbook -i "$HOSTS" "$PLAYBOOK"

exit 0
