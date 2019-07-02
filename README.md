# My dotfiles

## Overview
This dotfiles is to setup a basic system envionment on OS X/Linux.

## Usage
This dotfiles is design to download/clone the repository to local first and then create links to home directory.
Suppose the `dotfiles` folder is at home folder, e.g. `~/dotfiles`.

### Get the repository at local

There are following ways to get the respository ready at local:

* Copy the `dotfiles` folder from another storage, e.g. an external disk.
* Download the `dotfiles` from respository directly.
* Clone the `dotfiles` from respository. 
    ```bash
    cd ~
    git clone https://billyang@bitbucket.org/billyang/dotfiles.git dotfiles
    ```

### Installation
Once the `dotfiles` is ready, it can be installed by script:
```
    cd ~/dotfiles
    source config.sh -i
```

## Extra setup
Some customer commands need to be setup mannually for the sake of credential, e.g. git config.
Those config can goto `bashrc`.

### Git config
```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="_MY_NAME"
GIT_AUTHOR_EMAIL="_MY_EMAIL"
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.name "$GIT_AUTHOR_NAME"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```