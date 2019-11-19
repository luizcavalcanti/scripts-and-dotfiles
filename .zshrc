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

if [ -x "$(command -v pipenv)" ]; then
    eval "$(pipenv --completion)"
fi

if [ -s "/usr/local/bin/virtualenvwrapper.sh" ]; then
    export WORKON_HOME=~/.virtualenvs
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
    source /usr/local/bin/virtualenvwrapper.sh
fi


# Git
function git_status() {
    branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/')
    diff_list=$(git diff-index --name-only HEAD 2> /dev/null)

    if [ ! "$branch" = "" ] && [ ! "$diff_list" = "" ]
    then
        echo "$branch 🚧";
    elif [ ! "$branch" = "" ]
    then
        echo "$branch"
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
eval $(/usr/libexec/path_helper -s)


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
export PS1='%F{012}%n 🐙 %F{010}%1~ %F{011}$(git_status) %F{255}$ '

export PATH="$HOME/.cargo/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/laluiz.c/.sdkman"
[[ -s "/Users/laluiz.c/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/laluiz.c/.sdkman/bin/sdkman-init.sh"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
