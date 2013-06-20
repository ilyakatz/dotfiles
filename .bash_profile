export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH="/usr/local/bin:/usr/local/mysql/bin:$PATH"

ssh-add

source ~/.git_profile

[[ -s "/Users/ilyakatz/.rvm/scripts/rvm" ]] && source "/Users/ilyakatz/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
alias wget="curl -O"

source ~/.aliases

# MacPorts Installer addition on 2012-02-22_at_11:05:20: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# https://github.com/pahen/dotfiles
source ~/.completions

set -o vi
