# [My dotfiles with zsh](git@github.com:billyangbc/dotfiles.git)

## Overview
This dotfiles repository is to set up my preferred environment config on OS X/Linux.
However, Linux's shells are getting better and better, so that this one repository is trying to keep simple and easy to update.
This repository does not include `bashrc` setting.

## Usage
An easy way to use this repository is to download/clone it to local and run `bootstrap.sh` from local folder as hidden folder.

### Clone `dotfiles` the repository to local

```bash
git clone https://github.com/billyangbc/dotfiles.git dotfiles
```
### Preset your personal settings

If `preset` file exists, it will be sourced before the script is called.
You can use this file for personal settings that you don’t want to commit to a public repository.

An `preset` file looks something like this:

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="_MY_NAME"
GIT_AUTHOR_EMAIL="_MY_EMAIL"
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
```
### Installation
Run `bootstrap.sh`:

```bash
cd dotfiles
./bootstrap.sh
```

## Customize settings
### Change zsh theme
The zsh config file is `roles/zsh/templates/zshrc.j2`. If you want to use specified themes, you can update the themes list in `roles/zsh/vars/main.yml`.
```yaml
zsh_theme_random_list: "'agnoster' 'miloshadzic' 'gozilla' 'pygmalion' 'simple' 'lukerandall'"
```
Then run `./bootstrap.sh` again after the file is updated.

### Add more aliases
You can update `resources/aliases` to add more aliases. e.g. add `k` for `kubectl` command:
```bash
# kubernetes
alias k='kubectl'
```

### Autocomplete settings
Add autocomplete settings in `resources/aliases` file, e.g.:
```bash
# Autocomplete
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```