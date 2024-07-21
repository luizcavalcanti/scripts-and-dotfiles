# My local binaries path
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH

# Haskell
if [ -x "$(command -v ghc)" ]; then
    export PATH=$HOME/Library/Haskell/bin:$PATH
fi


# Matlab
if [ -s "/Applications/MATLAB_R2015a.app" ]; then
    export PATH=/Applications/MATLAB_R2015a.app/bin:$PATH
fi


# Go
if [ -s "/usr/local/opt/go" ]; then
    export PATH=$PATH:/usr/local/opt/go/libexec/bin
    export GOPATH=$HOME/workspace/go
    export GOBIN=$HOME/workspace/go/bin
fi


# Ruby
if [ -s "$HOME/.rvm/" ]; then
    export PATH=$PATH:$HOME/.rvm/bin
    source $HOME/.rvm/scripts/rvm
fi


# Rust
if [ -s "$HOME/.cargo" ]; then
    export PATH=$HOME/.cargo/bin:$PATH
fi


# Python
if [ -x "$(command -v python3)" ]; then
    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8
fi

if [ -s "/usr/local/bin/virtualenvwrapper.sh" ]; then
    export WORKON_HOME=~/.virtualenvs
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
    source /usr/local/bin/virtualenvwrapper.sh
fi


# Git
# if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
#    . `brew --prefix`/etc/bash_completion.d/git-completion.bash
#fi
if [ -f /etc/profile.d/bash_completion.sh ]; then
    source /etc/profile.d/bash_completion.sh
fi

function git_status() {
    branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')
    diff_list=$(git diff-index --name-only HEAD 2> /dev/null)

    if [ ! "$branch" = "" ] && [ ! "$diff_list" = "" ]
    then
        echo " $branch 🚧";
    elif [ ! "$branch" = "" ]
    then
        echo " $branch"
    fi
}


# Fuzzy search with fzf
if [ -s "$HOME/.fzf.bash" ]; then
    source ~/.fzf.bash
fi


# Youtube-dl
if [ -x "$(command -v youtube-dl)" ]; then
    function youtube-dl_best() {
        youtube-dl -ci -o "%(title)s-%(id)s.%(ext)s" -f 'bestvideo[ext!=webm]+bestaudio[ext!=webm]/mp4' $1
    }
fi


# Bash history
export HISTCONTROL=ignoredups:erasedups
# eval $(/usr/libexec/path_helper -s)


## PS1 Prompt
WHITE="\[\e[01;00m\]"
RED="\[\e[01;31m\]"
GREEN="\[\e[01;32m\]"
DARKGREEN="\[\e[0;32m\]"
YELLOW="\[\e[01;33m\]"
BLUE="\[\e[01;34m\]"
CYAN="\[\e[01;36m\]"
WEIRD_BLUE="\[\e[38;5;27m\]"

export PS1='\[\e[01;34m\]\u \[\e[01;32m\][\w]\[\e[01;33m\]$(git_status)\n🦑\[\e[01;00m\] '

# Created by `pipx` on 2024-03-07 20:51:35
export PATH="$PATH:/home/luiz/.local/bin"

# Aliases
source ~/.aliases
