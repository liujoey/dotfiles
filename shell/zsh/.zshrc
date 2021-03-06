# zmodload zsh/zprof
export ZGEN_AUTOLOAD_COMPINIT=0
AUTOPAIR_INHIBIT_INIT=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if ! source "$ZGEN_DIR/init.zsh"; then
    _load_repo tarjoilija/zgen $ZGEN_DIR zgen.zsh
    echo "Creating zgen save"
    _cache_clear

    zgen load hlissner/zsh-autopair autopair.zsh develop
    zgen load zsh-users/zsh-history-substring-search
    zgen load zsh-users/zsh-autosuggestions
    zgen load zsh-users/zsh-completions src
    zgen load mafredri/zsh-async
    zgen load wfxr/forgit

    if [[ -z $SSH_CONNECTION ]]; then
        zgen load zdharma/fast-syntax-highlighting
    fi

    zgen save
fi

_load shell/zsh/config.zsh
_load shell/zsh/completion.zsh
_load shell/zsh/keybinds.zsh

#
autoload -Uz compinit && compinit -d $ZSH_CACHE/zcompdump
_load_all aliases.zsh

#
export _FASD_DATA="$XDG_CACHE_HOME/fasd"
export _FASD_VIMINFO="$XDG_CACHE_HOME/viminfo"
_cache fasd --init posix-alias zsh-{hook,{c,w}comp{,-install}}
autopair-init

export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
path=( $PYENV_ROOT/bin $path )
eval "$(pyenv init - --no-rehash)"
eval "$(pyenv virtualenv-init -)"

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=1'

eval "$(starship init zsh)"
# zprof
# vim:set ft=sh:
