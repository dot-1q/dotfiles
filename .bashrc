# ------------------------ INJECTED BY ME ------------------------------
PROMPT_LONG=20
PROMPT_MAX=95
PROMPT_AT=@

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
        [[ -n "$B" ]] && B="$g($b$B$g)"

        short="$u\u$g$PROMPT_AT$h\h$g:$w$\w$B$p$P$x "
        long="$u\u$g$PROMPT_AT$h\h$g:$w$\w$B\n$e$P$x "
        double="$g╔ $u\u$g$PROMPT_AT$h\h$g:$w$\w\n$g║ $B\n$g╚ $p$P$x "

        if ((${#countme} > PROMPT_MAX)); then
                PS1="$double"
        elif ((${#countme} > PROMPT_LONG)); then
                PS1="$long"
        else
                PS1="$short"
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
