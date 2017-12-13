#!/bin/bash
################################################################################
# This script backup dotfiles from the home directory and set them back
# this script need to be in the same folder of dotfiles
################################################################################

#### Variables ####
PROGNAME=${0##*/}
# dotfiles folder
DIR=`pwd`
# list of files/folders to symlink in homedir
files="vimrc vim bashrc aliases"

#### functions ####
copy() {
    # copy source folder
    from=$1
    # copy destination folder
    to=$2
    # if delete source after copy
    delete=$3

    # copy dotfiles between home folder and backup folder
    for file in $files; do
        # files in home folder need '.' prefix
        if [ ${from} == ~ ]; then
            src=${from}/.${file}
            dest=${to}/${file}
        else
            src=${from}/${file}
            dest=${to}/.${file}
        fi

        # use sync if it is a folder
        if [[ -d ${src} ]]; then
            rsync -r ${src}/ ${dest}
        else
            cp ${src} ${dest}
        fi

        # delete file if required
        if [ "${delete}" == "1" ]; then
            rm -rf ${src}
        fi
    done
}

backup() {
    # bakcup folder with time stamp
    stamp=`date +"%Y%m%d%H%M"`
    dir_backup="${DIR}/_bak_${stamp}"
    mkdir -p -m +w ${dir_backup}
    copy ~ ${dir_backup}
}

install() {
    # original dotfiles backup folder
    dir_old="${DIR}/_old"
    # create dotfiles_old in homedir
    echo "Creating ${dir_old} for backup of existing dotfiles in home folder"
    mkdir -p -m 777 ${dir_old}
    echo "...done"

    # backup the original files
    copy ~ ${dir_old} "1"

    # create symlinks
    for file in $files; do
        echo "Creating symlink to $file in home folder."
        ln -s ${DIR}/$file ~/.$file
    done
}

help_message() {
    cat <<- _EOF_
$PROGNAME
    Script to bakcup dotfiles to respostory and install them to home folder.

OPTIONS:
    -h              Display this help message and exit.
    -b              Backup current dotfiles
    -i              Install dotfile to current system
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
while getopts ":bih:" opt; do
    case "${opt}" in
        b)
            # backup dotfiles from home folder to repository
            backup
            exit
            ;;
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
