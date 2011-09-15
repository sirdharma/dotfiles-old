#
# .bashrc by François Pradel <francois.pradel@gmail.com>
#


# uname & hostname -------------------------------------------------------------
OS=`uname -s`
HOSTNAME=`uname -n | sed 's/\..*$//'`


# prompt -----------------------------------------------------------------------
PS1='\[\033[1;32m\]\u\[\033[00m\]@\[\033[1;32m\]\h\[\033[00m\]:\[\033[1;34m\]\w\[\033[00m\]\$ '


# general options --------------------------------------------------------------
bind "set bell-style none"
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"


# history ----------------------------------------------------------------------
shopt -s histappend


# completion -------------------------------------------------------------------
case $OS in
    Linux)
        # apt
        if [ -f /etc/bash_completion ]; then
                . /etc/bash_completion
        # ipkg
        elif [ -f /opt/etc/bash_completion ]; then
            . /opt/etc/bash_completion
        fi
        ;;
    Darwin)
        # port
        if [ -f /opt/local/etc/bash_completion ]; then
            . /opt/local/etc/bash_completion
        fi
        ;;
    FreeBSD)
        # pkg_add
        if [ -f /usr/local/etc/bash_completion ]; then
            . /usr/local/etc/bash_completion
        fi
        ;;
    Minix)
        # pkgin
        ;;
    *)
        echo "bash-completion: unknown operating system"
        ;;
esac

# bindings ---------------------------------------------------------------------
bind '"\e[1;5D"':backward-word
bind '"\e[1;5C"':forward-word


# xterm ------------------------------------------------------------------------
case $TERM in
    xterm*)
        PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME}\007"'
        ;;
esac


# source .environment (shell-independent) --------------------------------------
if [[ -f ~/.environment ]]; then
    . ~/.environment
fi
