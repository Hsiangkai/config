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
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
PATH="$POWERLINE_SOURCE/scripts:$PATH"

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
