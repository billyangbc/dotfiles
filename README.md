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

### Add custom commands without creating a new fork

If `extra` file exists, it will be sourced along with the other files.
You can use this to add a few custom commands without the need to fork this entire repository,
or to add commands you don’t want to commit to a public repository.

An `extra` file looks something like this:

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