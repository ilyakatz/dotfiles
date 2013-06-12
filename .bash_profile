export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH="/usr/local/bin:/usr/local/mysql/bin:$PATH"

ssh-add

source ~/.git_profile

[[ -s "/Users/ilyakatz/.rvm/scripts/rvm" ]] && source "/Users/ilyakatz/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
alias wget="curl -O"

alias gist='nocorrect gist'
alias gitl='git log --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%an, %cr)%Creset'\'' --abbrev-commit --date=relative'
alias gitls='gitl --max-count=5'
alias grm='git ls-files --deleted | xargs git rm'
alias gpr='git pull --rebase'
alias gma='git commit -am'
alias gm='git commit -m'
alias gbl="git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format='%(committerdate:short) | %(authorname) | %(refname:short)'"


alias b=bundle
alias be='BUNDLE_GEMFILE=/Users/ilyakatz/ws/platform/Gemfile.local b exec'
alias bec='be cucumber'
alias ber='be rspec'
alias bes='be spork'
alias besc='bes cucumber'
alias besr='bes rspec'

#https://github.com/challengepost/platform/wiki/Setup-Jenkins-CLI
alias jbuild='cd ~/ws/platform && build/schedule_build.sh -s >& /dev/null & '

# MacPorts Installer addition on 2012-02-22_at_11:05:20: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# https://github.com/pahen/dotfiles
source ~/.completions

set -o vi
