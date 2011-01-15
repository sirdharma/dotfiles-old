#
# .profile by François Pradel <francois.pradel@gmail.com>
#

# umask
umask 022

# uname & hostname -------------------------------------------------------------
OS=`uname -s`
HOSTNAME=`hostname -s`

# PATH -------------------------------------------------------------------------
case $HOSTNAME in
    yellowstone)
        export PATH=/usr/local/bin:/usr/local/sbin:/usr/syno/bin:/usr/syno/sbin:/usr/bin:/usr/sbin:/bin:/sbin
        ;;
    *)
        ;;
esac

case $OS in
    Darwin)
        if [ -x /usr/libexec/path_helper ]; then
            eval `/usr/libexec/path_helper -s`
        fi
        # port
        if [ -x /opt/local ]; then
            export PATH=/opt/local/bin:/opt/local/sbin:$PATH
        fi
        # netsoul
        if [ -x /usr/local/netsoul ]; then
            export PATH=/usr/local/netsoul:$PATH
        fi
        # We should put /usr/local first for Homebrew
        export PATH=/usr/local/bin:/usr/local/sbin:$PATH
        export PATH=/usr/local/Cellar/python/2.7.1/bin:$PATH
        export PATH=/usr/local/Cellar/ruby/1.9.2-p136/bin:$PATH
        ;;
    Linux)
        # ipkg
        if [ -x /opt ]; then
            export PATH=/opt/bin:/opt/sbin:$PATH
        fi
        ;;
    *)
        ;;
esac

# EDITOR -----------------------------------------------------------------------
export EDITOR='vim'

# PAGER ------------------------------------------------------------------------
export PAGER='less'

# LANG -------------------------------------------------------------------------
#export LANG=en_US.UTF-8
#export LC_ALL=en_US.UTF-8
case $OS in
    Linux)
#        export GDM_LANG=en_US.UTF-8
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
          export CLICOLOR=
        ;;
    *)
        echo "ls: unknown operating system"
        ;;
esac

case $HOSTNAME in
    yellowstone|scope|zion)
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
