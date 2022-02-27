# My local binaries path
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH

autoload -Uz compinit
compinit

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


#Java
if [ -s "$HOME/.sdkman" ]; then
    export SDKMAN_DIR="$HOME/.sdkman"
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
fi
if [ -f "$HOME/.env" ]; then
    source "$HOME"/.env
fi


#Node
if [ -s "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
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

if which pyenv-virtualenv-init > /dev/null; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

if [ -s "/usr/local/bin/virtualenvwrapper.sh" ]; then
    export WORKON_HOME=~/.virtualenvs
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
    source /usr/local/bin/virtualenvwrapper.sh
fi


# Git
function git_status() {
    branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/')
    user=$(git config --get user.email | cut -d'@' -f2)
    diff_list=$(git diff-index --name-only HEAD 2> /dev/null)

    if [ ! "$branch" = "" ] && [ ! "$diff_list" = "" ]
    then
        echo "$branch ($user) 🚧 ";
    elif [ ! "$branch" = "" ]
    then
        echo "$branch ($user) "
    fi
}


# Fuzzy search with fzf
if [ -s "$HOME/.fzf.zsh" ]; then
    source ~/.fzf.zsh
fi


# Youtube-dl
if [ -x "$(command -v youtube-dl)" ]; then
    function youtube-dl_best() {
        youtube-dl -ci -o "%(title)s-%(id)s.%(ext)s" -f 'bestvideo[ext!=webm]+bestaudio[ext!=webm]/mp4' $1
    }
fi

export PATH="/usr/local/sbin:$PATH"


# ZSH history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS


# Colored ls
alias ls="ls -G"


# Colored man
man() {
    env \
        LESS_TERMCAP_mb=$'\e[1;31m' \
        LESS_TERMCAP_md=$'\e[1;31m' \
        LESS_TERMCAP_me=$'\e[0m' \
        LESS_TERMCAP_se=$'\e[0m' \
        LESS_TERMCAP_so=$'\e[1;44;33m' \
        LESS_TERMCAP_ue=$'\e[0m' \
        LESS_TERMCAP_us=$'\e[1;' \
        man "$@"
}

# Custom prompt
setopt PROMPT_SUBST
export PS1='%n 🐙 %1~ %F{001}$(git_status)%F{000}$ '
