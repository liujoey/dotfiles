# disable global zsh config; we'll handle it ourselves
unsetopt GLOBAL_RCS
source $(cd ${${(%):-%x}:A:h}/../.. && pwd -P)/env

# Move ZDOTDIR from $HOME to reduce dotfile pollution.
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZGEN_DIR="$XDG_CACHE_HOME/zgen"
export ZSH_CACHE="$XDG_CACHE_HOME/zsh"

# paths
typeset -gU cdpath fpath mailpath path
path=( $XDG_BIN_HOME $DOTFILES/bin $DOTFILES_DATA/*.topic/bin(N) $path )
fpath=( $ZDOTDIR/functions $XDG_BIN_HOME $fpath )

# envvars
export SHELL=$(command -v zsh)
export LANG=${LANG:-en_US.UTF-8}
export PAGER=less
export LESS='-R -i -w -M -z-4'
export LESSHISTFILE="$XDG_DATA_HOME/lesshst"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"

#
# FZF
#
export FZF_DEFAULT_COMMAND='(fd --type f) 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_DEFAULT_OPTS='--color light'

#
# Mac os location based proxy auto config
#
if [[ $OSTYPE =~ 'darwin' ]]; then
  location_string=`networksetup -getcurrentlocation`
  if [[ $location_string == 'Philips' ]]; then
    export http_proxy=http://amec.zscaler.philips.com:10015
    export https_proxy=$http_proxy
    export no_proxy=127.0.0.1,localhost,.philips.com
  else
    unset http_proxy
    unset https_proxy
    unset ALL_PROXY
    unset no_proxy
  fi
fi

# initialize enabled topics
_load_all env.zsh
