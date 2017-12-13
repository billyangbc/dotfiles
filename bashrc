# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#-----------------------------#
# SHELL - HISTORY             #
#-----------------------------#
# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth:erasedups
export PROMPT_COMMAND="history -a"
# append to the history file, don't overwrite it
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
HISTFILE=~/.bash.log
HISTIGNORE=' *:&:?:??'
HISTTIMEFORMAT="%F %T: "

#-------------------------#
# SHELL - LOOK AND FEEL   #
#-------------------------#
shopt -s extglob
shopt -qs globstar
shopt -qs checkwinsize
shopt -qs hostcomplete
shopt -qs no_empty_cmd_completion
stty stop undef
stty -echoctl

# set colors
DEFAULT="\[\033[0;00m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
PURPLE="\[\033[0;35m\]"
LBLUE="\[\033[0;36m\]"
WHITE="\[\033[0;37m\]"
CLEAR="\[\033[0;30m\]"
NEWLINE="\n"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1="${YELLOW}[${WHITE}\t${YELLOW}]:-[${RED}\u@\h${YELLOW}]:${PURPLE}\w>${DEFAULT}: "
fi
unset color_prompt force_color_prompt


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{aliases,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

export DEV_ROOT=~/Projects
export PATH=.:$PATH
