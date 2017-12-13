# Bill’s dotfiles

This is a collection of dotfiles for daily use on OS X/linux system.
They path should be `~/Projects/dotfiles`.
The included setup script creates symbolic links from home directory to the files which are located in `~/Projects/dotfiles`.

## Installation

### Using Git and the config script

Clone the repository into `~/Projects/dotfiles`, then run the config script.
The script will pull in the latest version and create symbolic links to home folder.

```bash
cd ~/Projects
git clone https://byang_adperfect@bitbucket.org/byang_adperfect/dotfiles-bill.git dotfiles
cd dotfiles && source config.sh -i
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files.
You can use this to add a few custom commands without the need to fork this entire repository,
or to add commands you don’t want to commit to a public repository.

A `~/.extra` looks something like this:

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Bill Yang"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="bill.yang@adperfect.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```
