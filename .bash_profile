 # COLORS (for the PS1 prompt) #
WHITE="\[\e[01;00m\]"
RED="\[\e[01;31m\]"
GREEN="\[\e[01;32m\]"
DARKGREEN="\[\e[0;32m\]"
YELLOW="\[\e[01;33m\]"
BLUE="\[\e[01;34m\]"
CYAN="\[\e[01;36m\]"
WEIRD_BLUE="\[\e[38;5;27m\]"

# Print current git branch
function git_status() {
    branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/')
    diff_list=$(git diff-index --name-only HEAD 2> /dev/null)

    if [ ! "$branch" = "" ] && [ ! "$diff_list" = "" ]
    then
        echo " $branch 🚧";
    elif [ ! "$branch" = "" ]
    then
        echo " $branch"
    fi
}

## GIT PS1 Prompt
export PS1="$WEIRD_BLUE\u 🐙 $GREEN\W$YELLOW\$(git_status) $WHITE\$ "

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

if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
  . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
