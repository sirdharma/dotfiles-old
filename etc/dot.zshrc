# umask
umask 022

# uname & hostname -------------------------------------------------------------
OS=`uname -s`
HOSTNAME=`hostname -s`


# PATH -------------------------------------------------------------------------
case $OS in
	Darwin)
		# Xcode4
		if [[ -x /Xcode4 ]]; then
			export PATH=/Xcode4/usr/bin:/Xcode4/usr/sbin:$PATH
		fi
		# port
		if [[ -x /opt/local ]]; then
			export PATH=/opt/local/bin:/opt/local/sbin:$PATH
		fi
		if [[ -x /usr/local/texlive ]]; then
			export PATH=/usr/local/texlive/2009/bin/universal-darwin-64:$PATH
		fi
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

case $HOSTNAME in
	yellowstone|scope)
		alias ll='ls -lhA'
		;;
	*)
		alias ll='ls -lh'
		;;
esac


# less(1) ----------------------------------------------------------------------
case $OS in
	Darwin|Linux|FreeBSD)
		export LESS='-r'
		;;
	*)
		echo "less: unknown operating system"
		;;
esac


# LESS_TERMCAP -----------------------------------------------------------------
# http://linux.die.net/man/5/termcap
autoload colors; colors
#export LESS_TERMCAP_mb="$fg_bold[cyan]"					# Start blinking
export LESS_TERMCAP_md="$fg_bold[red]"						# Start bold mode
export LESS_TERMCAP_so="$bg_bold[yellow]$fg_bold[black]"	# Start standout mode
export LESS_TERMCAP_us="$fg_bold[green]"					# Start underlining
export LESS_TERMCAP_se="$reset_color"						# End standout mode
export LESS_TERMCAP_ue="$reset_color"						# End underlining
export LESS_TERMCAP_me="$reset_color"						# End all mode like so, us, mb, md and mr


# prompt -----------------------------------------------------------------------
autoload colors; colors
PROMPT="%{$fg_no_bold[green]%}%n@%m%{$reset_color%}:%{$fg_no_bold[blue]%}%~%{$reset_color%}$ "
RPROMPT="%(?.%{$fg_bold[blue]%}.%{$fg_bold[red]%})?%{$reset_color%}"
setopt transient_rprompt


# history ----------------------------------------------------------------------
setopt appendhistory		# append history
setopt histignorealldups	# ignore all dups
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000


# completion -------------------------------------------------------------------
autoload -Uz compinit; compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LSCOLORS}"
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' # case-insensitive


# bindings ---------------------------------------------------------------------
bindkey -e
bindkey "\eb" backward-word			# option cursor left
bindkey "\ef" forward-word			# option cursor right
bindkey "\e[H" beginning-of-line	# home
bindkey "\e[F" end-of-line			# end
bindkey "\e[3~" delete-char			# forward delete
WORDCHARS="${WORDCHARS:s#/#}"		# '/' mark separate words


# history-search ---------------------------------------------------------------
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "\e[A" history-beginning-search-backward-end	# cursor up
bindkey "\e[B" history-beginning-search-forward-end		# cursor down
