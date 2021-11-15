#!/bin/bash
################################################################################
# This script backup dotfiles from the home directory and install the new config
# this script need to be in the same folder of dotfiles
################################################################################

#### Variables ####
PROGNAME=${0##*/}
# dotfiles folder
DIR=$(dirname "$0")
# list of files/folders to symlinks in home folder
FILE_LIST="vimrc vim aliases"
SHELL_LIST="zshrc bashrc"
EXTRA="extra"

#### functions ####
install() {
    # copy the dotfile folder to home folder
    if [[ ${DIR} -ef ~/.dotfiles ]]; then
        echo "Already in ~/.dotfiles folder."
    else
        rm -rf ~/.dotfiles/
        rsync -r ${DIR}/ ~/.dotfiles
    fi

    # create symlinks
    for file in $FILE_LIST; do
        echo "Creating symlink to $file in home folder."
        ln -sf ~/.dotfiles/$file ~/.$file
    done

    # if the extra file exist, source it
    if [ -e $EXTRA ]; then
        source $EXTRA
    fi

    # make it work right away
    for shf in ${SHELL_LIST}; do
        if ! grep '. ~/.aliases' ~/.${shf} ; then
            echo 'if [ -f ~/.aliases ]; then' >> ~/.${shf}
            echo '    . ~/.aliases ' >> ~/.${shf}
            echo 'fi' >> ~/.${shf}

            echo "Above lines have been appended to ${shf}"
        else
            echo "Above lines exist in ${shf}"
        fi
    done

    source ~/.aliases
}

help_message() {
    cat <<- _EOF_
$PROGNAME
    Script to install dotfiles to current system.

OPTIONS:
    -h      Display this help message and exit.
    -i      Install dotfiles to current system
_EOF_
  return
}

# reset OPTIND
OPTIND=1
# Parse command-line
if [ $# -lt 1 ]
then
    help_message
    exit
fi
while getopts ":ih:" opt; do
    case "${opt}" in
        i)
            # install dotfiles to home folder
            install
            exit
            ;;
        h)
            help_message
            exit
            ;;
        *)
            help_message
            exit 1
            ;;
    esac
done
shift "$((OPTIND-1))"
