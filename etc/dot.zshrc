#
# .zshrc by François Pradel <francois.pradel@gmail.com>
#

# uname & hostname -------------------------------------------------------------
OS=`uname -s`
HOSTNAME=`hostname -s`


# prompt -----------------------------------------------------------------------
autoload colors;
colors
PROMPT="%{$fg_bold[green]%}%n%{$reset_color%}@%{$fg_bold[green]%}%m%{$reset_color%}:%{$fg_bold[blue]%}%~%{$reset_color%}%(!.#.$) "


# general options --------------------------------------------------------------
setopt extendedglob     # extended globing
setopt nomatch          #
setopt notify           # report the status of background jobs immediatly
unsetopt autocd         # no auto 'cd'
unsetopt beep           # no beep


# history ----------------------------------------------------------------------
setopt appendhistory        # append history
setopt histignorealldups    # ignore all dups
HISTFILE=~/.zhistory
HISTSIZE=100000
SAVEHIST=100000


# completion -------------------------------------------------------------------
autoload -Uz compinit;
compinit

#zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*' menu select
case $OS in
    Linux)
        eval `dircolors -b`     # for LS_COLORS
        zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
        ;;
    Darwin)
        ;;
esac
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' # case-insensitive


# bindings ---------------------------------------------------------------------
bindkey -e  # emacs-style key bindings

bindkey "\e[3~"     delete-char         # forward delete
bindkey "\e[1;5D"   backward-word       # control cursor left
bindkey "\e[1;5C"   forward-word        # control cursor right
bindkey "\e[H"      beginning-of-line   # home
bindkey "\e[F"      end-of-line         # end
bindkey "\eOH"      beginning-of-line   # home
bindkey "\eOF"      end-of-line         # end

WORDCHARS="${WORDCHARS:s#/#}"           # '/' marks separate words


# history-search ---------------------------------------------------------------
autoload -Uz history-search-end

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "\e[A" history-beginning-search-backward-end            # cursor up
bindkey "\e[B" history-beginning-search-forward-end             # cursor down


# xterm ------------------------------------------------------------------------
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%m\a"}
        ;;
esac


# stty(1) ----------------------------------------------------------------------
case $OS in
    Darwin)
        stty status '^T'    # STATUS character
        stty lnext  '^V'    # LNEXT character
        stty discard '^O'   # DISCARD charcater
        ;;
esac


# LESS_TERMCAP -----------------------------------------------------------------
# http://linux.die.net/man/5/termcap
autoload colors; colors

#export LESS_TERMCAP_mb="$fg_bold[cyan]"                        # Start blinking
export LESS_TERMCAP_md="$fg_no_bold[red]"                       # Start bold mode
export LESS_TERMCAP_so="$bg_no_bold[yellow]$fg_no_bold[black]"  # Start standout mode
export LESS_TERMCAP_us="$fg_no_bold[green]"                     # Start underlining
export LESS_TERMCAP_se="$reset_color"                           # End standout mode
export LESS_TERMCAP_ue="$reset_color"                           # End underlining
export LESS_TERMCAP_me="$reset_color"                           # End all mode like so, us, mb, md and mr


# source .profile (shell-independent) ------------------------------------------
if [[ -f ~/.profile ]]; then
    . ~/.profile
fi
