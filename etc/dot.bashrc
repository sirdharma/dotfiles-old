# uname & hostname -------------------------------------------------------------
OS=`uname -s`
HOSTNAME=`hostname -s`


# PATH -------------------------------------------------------------------------
case $OS in
	Darwin)
		# Xcode4
		if [ -e /Xcode4/usr ]; then
			export PATH=/Xcode4/usr/bin:/Xcode4/usr/sbin:$PATH
		fi
		# port
		export PATH=/opt/local/bin:/opt/local/sbin:$PATH
		;;
esac


# EDITOR -----------------------------------------------------------------------
export EDITOR='vim'


# PAGER ------------------------------------------------------------------------
export PAGER='less'


# LANG -------------------------------------------------------------------------
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
case $OS in
	Linux)
		export GDM_LANG=en_US.UTF-8
		;;
	*)
		;;
esac


# grep(1) ----------------------------------------------------------------------
case $OS in
	Linux|Darwin|FreeBSD)
		export GREP_OPTIONS='--color=auto -i'
		;;
	*)
		echo "grep: unknow operating system"
		;;
esac


# ls(1) ------------------------------------------------------------------------
case $OS in
	Linux)
		alias ls='ls --color=auto'
		;;
	Darwin|FreeBSD)
  		export CLICOLOR=1
		;;
	*)
		echo "ls: unknown operating system"
		;;
esac

alias ll='ls -lh'
alias lla='ls -lha'


# less(1) ----------------------------------------------------------------------
case $OS in
	Darwin|Linux|FreeBSD)
		export LESS='-R'
		;;
	*)
		echo "less: unknown operating system"
		;;
esac


# LESS_TERMCAP -----------------------------------------------------------------

export LESS_TERMCAP_mb=$'\e[01;31m'
export LESS_TERMCAP_md=$'\e[01;37m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;32m'


# prompt -----------------------------------------------------------------------
PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[00m\]\$ '


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
	*)
		echo "bash-completion: unknown operating system"
		;;
esac


# readline ---------------------------------------------------------------------
bind "set bell-style none"
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"
