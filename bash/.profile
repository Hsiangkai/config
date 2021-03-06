# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# setup powerline source tree
POWERLINE_SOURCE=$HOME/source/powerline/powerline

# set PATH so it includes user's private bin directories
PATH=$POWERLINE_SOURCE/scripts:$PATH

# set arm development tools
PATH=$HOME/arm-dev/bin:$PATH
PATH=$HOME/arm-elf-dev/bin:$PATH

# setup icecc path
PATH=/usr/lib/icecc/bin:$HOME/icecc/bin:$PATH

# powerline settings
#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. $POWERLINE_SOURCE/powerline/bindings/bash/powerline.sh

# setup default editor
EDITOR=vim

# set locale
LC_ALL='en_US.UTF-8'
LANG='en_US.UTF-8'
LC_CTYPE='en_US.UTF-8'

# show git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

DISPLAY=localhost:10.0
