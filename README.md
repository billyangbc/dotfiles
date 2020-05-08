# My dotfiles

https://billyang@bitbucket.org/billyang/dotfiles

## Overview
This dotfiles repository is to set up my preferred environment config on OS X/Linux.
However, Linux's shells are getting better and better, so that this one repository is trying to keep simple and easy to update.
This repository does not include `bashrc` setting.

## Usage
An easy way to use this repository is to download/clone it to local and put it in home folder as hidden folder, e.g. `~/.dotfiles`.
Then create symbol links to this hidden folder.

Note: In order to user vim, the vim has to be installed first.
```
sudo apt update
sudo apt install vim
sudo apt-get install vim-gui-common
sudo apt-get install vim-runtime
```

## Using zsh
If you want use `zsh`, have it ready before install and configure the `dotfiles`.
```
sudo apt install zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc 
sudo apt install fonts-powerline
```

### Get the repository to local
An easy way to use this repository is to download/clone it to local and put it in home folder as hidden folder, e.g.  `~/.dotfiles`.  Then create symbol links to this hidden folder.

There are following ways to get the repository ready at local:
* Download the `dotfiles` from repository directly or where it is stored locally. Then copy the `dotfiles` folder from where it is stored, e.g. `~/Downloads/dotfiles`, to home folder:
    ```bash
    rsync -r ~/Downloads/dotfiles/ ~/.dotfiles
    ```

* Clone the `dotfiles` from repository. 
    ```bash
    cd ~
    git clone https://billyang@bitbucket.org/billyang/dotfiles.git .dotfiles
    ```

### Installation
Once the `~/.dotfiles` is ready, it can be installed by script:
```
    cd ~/.dotfiles
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
