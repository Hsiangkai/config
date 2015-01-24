
# MacPorts Installer addition on 2014-10-24_at_21:30:49: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH="/Users/hkwang/source/powerline/scripts:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /Users/hkwang/source/powerline/powerline/bindings/bash/powerline.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
