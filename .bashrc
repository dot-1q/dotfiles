# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls --color=auto'
        alias dir='dir --color=auto'
        #alias vdir='vdir --color=auto'

        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
        if [ -f /usr/share/bash-completion/bash_completion ]; then
                . /usr/share/bash-completion/bash_completion
        elif [ -f /etc/bash_completion ]; then
                . /etc/bash_completion
        fi
fi

export KUBECONFIG=~/.kube/config
PROMPT_LONG=30
PROMPT_MAX=95
PROMPT_AT=@

detect_venv() {
        pv=""
        # Detect python venv
        if [[ -n "${CONDA_DEFAULT_ENV}" ]]; then
                pv=" ($PYTHON_VENV_CHAR${CONDA_DEFAULT_ENV})"
        elif [[ -n "${VIRTUAL_ENV}" ]]; then
                pv=" ($PYTHON_VENV_CHAR$(basename "${VIRTUAL_ENV}"))"
        fi
}

__ps1() {
        local P='$' dir="${PWD##*/}" B countme short long double \
                r='\[\e[31m\]' g='\[\e[30m\]' h='\[\e[34m\]' \
                u='\[\e[33m\]' p='\[\e[32m\]' w='\[\e[35m\]' \
                b='\[\e[36m\]' x='\[\e[0m\]' e='\[\e[37m\]'

        [[ $EUID == 0 ]] && P='#' && u=$r && p=$u # root
        [[ $PWD = / ]] && dir=/
        [[ $PWD = "$HOME" ]] && dir='~'

        B=$(git branch --show-current 2>/dev/null)
        [[ $dir = "$B" ]] && B=.
        countme="$USER$PROMPT_AT$(hostname):$dir($B)\$ "

        [[ $B == master || $B == main ]] && b="$r"
        [[ -n "$B" ]] && B=" $b($B)"

        detect_venv # Check if we are in a python virtual env

        if ((${#countme} > PROMPT_MAX)); then
                # Doube line prompt
                PS1="$e╔ $\uu$g$PROMPT_AT$h\h$e:$w$\w\n$e║ $B \n$e╚$e$pv$p$P$x "
        elif ((${#countme} > PROMPT_LONG)); then
                # Text on next line (long)
                PS1="$u\u$e$PROMPT_AT$h\h$e:$w$\w$B$e$pv\n$P$x "
        else
                # Text on same line (short)
                PS1="$u\u$e$PROMPT_AT$h\h$e:$w$\w$B$e$pv$p$P$x "
        fi
}

PROMPT_COMMAND="__ps1"

alias 'k'=kubectl
alias 'kp'="kubectl get pods -n "
alias 'p'="python3"
alias 'de'="deactivate"
alias 'c'="clear"
alias 'h'="cd ~/"
alias 'v'="vi"
alias lh="ls -ahl"
alias free='free -h'
alias tree='tree -a'
alias df='df -h'
alias diff="diff --color"
alias gitl="git log -n 5 --graph --oneline"

# Vi mode when typing
set -o vi

bind -m vi-insert '"jk":vi-movement-mode'
bind -m vi-insert '"kj":vi-movement-mode'

#Export locales
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
