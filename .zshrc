setopt no_hup
setopt prompt_subst

autoload colors zsh/terminfo

if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
    (( count = $count + 1 ))
done
PR_NO_COLOUR="%{$terminfo[sgr0]%}"

if [[ $USER != root ]]; then
    PS1='$PR_GREEN%n@%m $PR_BLUE%~ $ $PR_NO_COLOUR'
else
    PS1='$PR_RED%n@%m $PR_BLUE%~ # $PR_NO_COLOUR'
fi

bindkey "\eOc" emacs-forward-word
bindkey "\eOd" emacs-backward-word

alias ls="ls -h --color=always"
alias ll="ls -l"
alias lla="ls -al"
alias svn="~/bin/svnc.py"

export EDITOR=qemacs

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} r:|[._-]=** r:|=**' 'r:|[._-]=* r:|=*'
zstyle :compinstall filename '/home/phtrivier/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U promptinit; promptinit

export HISTFILE=~/.zhistory
# Number of history events to remember in the current shell
export HISTSIZE=100000000
# Number of history events to save in HISTFILE
export SAVEHIST=100000000

if [ x$WINDOW != x ]; then
        # we are in screen
        precmd () {
                print -Pn "\ek%~\e\\"
        }
        preexec () {
                print -Pn "\ek[$1]%~\e\\"
        }
fi

# Bin should contain scripts
export PATH=$PATH:$HOME/bin
