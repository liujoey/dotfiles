# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
    zgen load MichaelAquilina/zsh-you-should-use

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

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'

#
export _FASD_DATA="$XDG_CACHE_HOME/fasd"
export _FASD_VIMINFO="$XDG_CACHE_HOME/viminfo"
_cache fasd --init posix-alias zsh-{hook,{c,w}comp{,-install}}
autopair-init

#
# PYENV
#
# export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
# eval "$(pyenv init --path)"
# eval "$(pyenv init - --no-rehash)"
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# eval "$(pyenv virtualenv-init -)"

#
# JENV
#
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

#
# Rancher desktop
#
export PATH="$HOME/.rd/bin:$PATH"

#
# Prompt
#
source "/opt/homebrew/opt/spaceship/spaceship.zsh"

# zprof
# vim:set ft=sh:
