# disable global zsh config; we'll handle it ourselves
unsetopt GLOBAL_RCS
source $(cd ${${(%):-%x}:A:h}/../.. && pwd -P)/env

eval "$(/opt/homebrew/bin/brew shellenv)"

# Move ZDOTDIR from $HOME to reduce dotfile pollution.
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZGEN_DIR="$XDG_CACHE_HOME/zgen"
export ZSH_CACHE="$XDG_CACHE_HOME/zsh"

# paths
typeset -gU cdpath fpath mailpath path
path=( $XDG_BIN_HOME $DOTFILES/bin $DOTFILES_DATA/*.topic/bin(N) /opt/podman/bin $path )
fpath=( $ZDOTDIR/functions $XDG_BIN_HOME $fpath )

# envvars
export SHELL=$(command -v zsh)
export LANG=${LANG:-en_US.UTF-8}
export PAGER=less
export LESS='-R -i -w -M -z-4'
export HISTCONTROL=ignoreboth
export LESSHISTFILE="$XDG_DATA_HOME/lesshst"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"

#
# FZF
#
export FZF_DEFAULT_COMMAND='(fd --type f) 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_PREVIEW_PREVIEW_BAT_THEME="Edge Serene"
export FZF_DEFAULT_OPTS='--reverse
--color=fg:-1,bg:-1,bg+:-1,spinner:2,hl:10,header:10,info:9,pointer:2,marker:2,fg+:12,prompt:2,hl+:2'
# export FZF_DEFAULT_OPTS='--reverse
# --color=fg:#4b505b,bg:#fafafa,hl:#5079be
# --color=fg+:#4b505b,bg+:#fafafa,hl+:#3a8b84
# --color=info:#88909f,prompt:#d05858,pointer:#b05ccc
# --color=marker:#608e32,spinner:#d05858,header:#3a8b84'

export FORGIT_FZF_DEFAULT_OPTS="--exact --cycle --border"

if /sbin/ifconfig -u -X "utun?" | grep -q "inet 10\.[0-9]"; then
  export http_proxy=http://www-proxy.us.oracle.com:80
  export https_proxy=$http_proxy
  export no_proxy='localhost,127.0.0.1,.us.oracle.com,.oraclecorp.com,.oci.oraclecorp.com'
  export ALL_PROXY=$http_proxy
else
  unset http_proxy
  unset https_proxy
  unset ALL_PROXY
  unset no_proxy
fi

# initialize enabled topics
_load_all env.zsh
# source "$HOME/.cargo/env"
