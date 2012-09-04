#
# .zshrc by François Pradel <francois.pradel@gmail.com>
#


# uname & hostname -------------------------------------------------------------
OS=`uname -s`
HOSTNAME=`uname -n | sed 's/\..*$//'`


# prompt -----------------------------------------------------------------------
autoload -Uz promptinit
promptinit
prompt walters
#autoload colors;
#colors
#PROMPT="%{$fg_bold[green]%}%n%{$reset_color%}@%{$fg_bold[green]%}%m%{$reset_color%}:%{$fg_bold[blue]%}%~%{$reset_color%}%(!.#.$) "


# general options --------------------------------------------------------------
setopt extendedglob # extended globing
setopt nomatch      # print error message if no match
setopt notify       # report the status of background jobs immediatly
unsetopt autocd     # no auto 'cd'
unsetopt beep       # no beep


# history ----------------------------------------------------------------------
setopt appendhistory        # append history
setopt histignorealldups    # ignore all dups
HISTFILE=~/.zhistory
HISTSIZE=100000
SAVEHIST=100000


# completion -------------------------------------------------------------------
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select

case $OS in
    Linux)
        # For LS_COLORS
        eval `dircolors -b`
        ;;
    Darwin)
        # Equivalent to BSD's default LSCOLORS
        LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
        ;;
esac

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'    # case-insensitive


# bindings ---------------------------------------------------------------------
bindkey -e                          # emacs-style key bindings

bindkey "\033[3~" delete-char       # forward delete
bindkey "\033[5D" backward-word     # control cursor left
bindkey "\033[5C" forward-word      # control cursor right
bindkey "\033[H"  beginning-of-line # home
bindkey "\033[F"  end-of-line       # end

WORDCHARS="${WORDCHARS:s#/#}"       # '/' marks separate words


# history-search ---------------------------------------------------------------
autoload -Uz history-search-end

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "\033[A" history-beginning-search-backward-end          # cursor up
bindkey "\033[B" history-beginning-search-forward-end           # cursor down


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
        stty discard '^O'   # DISCARD character
        ;;
esac


# source .environment (shell-independent) --------------------------------------
if [[ -f ~/.environment ]]; then
    . ~/.environment
fi


# unset ------------------------------------------------------------------------
unset OS
unset HOSTNAME
unset LS_COLORS
