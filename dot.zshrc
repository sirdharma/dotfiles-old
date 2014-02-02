#
# .zshrc by François Pradel <francois.pradel@gmail.com>
#


# Operating System & Hostname --------------------------------------------------

OS=`uname -s`                           # get OS
HOSTNAME=`uname -n | sed 's/\..*$//'`   # get HOSTNAME


# Prompt Themes ----------------------------------------------------------------
# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Prompt-Themes -

autoload -U promptinit  # autoload the function promptinit
promptinit              # initialize the use of prompt themes
prompt walters green    # select the prompt 'walters' with color 'green'


# General Options --------------------------------------------------------------

#setopt extendedglob # extended globing
#setopt nomatch      # print error message if no match
#setopt notify       # report the status of background jobs immediatly
#setopt autocd     # no auto 'cd'
#unsetopt beep       # no beep


# History ----------------------------------------------------------------------

setopt appendhistory        # append history
setopt histignorealldups    # ignore all dups
HISTFILE=~/.zhistory        # history file
HISTSIZE=65536              # history size
SAVEHIST=$HISTSIZE


# Colors -----------------------------------------------------------------------

# Customized LS_COLORS for Solarized Dark
LS_COLORS="di=34;100:ln=35;100:so=32;100:pi=33;100:ex=31;100:bd=90;46:cd=90;43:su=90;41:sg=90;46:tw=90;42:ow=90;43:"

case $OS in
    Linux)
        export LS_COLORS
        ;;
    Darwin)
        # Matching BSD's LSCOLORS
        export LSCOLORS="exfxcxdxbxAgAdAbAgAcAd"
        ;;
esac


# Completion System ------------------------------------------------------------
# http://zsh.sourceforge.net/Doc/Release/Completion-System.html ----------------

autoload -U compinit    # autoload the function compinit
compinit                # initialize the use of the completion system

zstyle ':completion:*' menu select  # menu selection will be started unconditionally
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}   # use LS_COLORS for lists
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'    # case-insensitive completion


# Bindings ---------------------------------------------------------------------

bindkey -e                          # emacs-style key bindings

bindkey "\033[3~" delete-char       # forward delete
bindkey "\033[5D" backward-word     # control cursor left
bindkey "\033[5C" forward-word      # control cursor right
bindkey "\033[H"  beginning-of-line # home
bindkey "\033[F"  end-of-line       # end

WORDCHARS="${WORDCHARS:s#/#}"       # '/' marks separate words


# History Search ---------------------------------------------------------------

autoload -U history-search-end

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


# Source .environment (shell-independent) --------------------------------------

if [[ -f ~/.environment ]]; then
    . ~/.environment
fi


# Unset variables --------------------------------------------------------------

unset OS        # clear OS
unset HOSTNAME  # clear HOSTNAME
