export ZGEN_AUTOLOAD_COMPINIT=0

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.secret.zsh ] && source ~/.secret.zsh

if ! source "$ZGEN_DIR/init.zsh"; then
    _load_repo tarjoilija/zgen $ZGEN_DIR zgen.zsh
    echo "Creating zgen save"
    _cache_clear

    zgen load zsh-users/zsh-history-substring-search
    zgen load zsh-users/zsh-autosuggestions
    zgen load zsh-users/zsh-completions src
    zgen load mafredri/zsh-async . main
    zgen load qoomon/zsh-lazyload
    zgen load wfxr/forgit . main
    zgen load MichaelAquilina/zsh-you-should-use

    if [[ -z $SSH_CONNECTION ]]; then
        zgen load zdharma/fast-syntax-highlighting . main
    fi

    zgen save
fi

autoload -Uz compinit && compinit -d $ZSH_CACHE/zcompdump

_load shell/zsh/config.zsh
_load shell/zsh/completion.zsh
_load shell/zsh/keybinds.zsh

_load_all aliases.zsh

#
# zoxide
#
lazyload zoxide cd -- '_cache zoxide init --cmd cd zsh'

#
# PYENV
#
# export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# lazyload pyenv -- 'eval "$(pyenv init --path)"; eval "$(pyenv init - --no-rehash)"; eval "$(pyenv virtualenv-init -)"'

#
# JENV
#
export PATH="$HOME/.jenv/bin:$PATH"
lazyload jenv -- '_cache jenv init - --no-rehash'
# eval "$(jenv init - --no-rehash)"
(jenv rehash &) 2> /dev/null

#
# Prompt
#
source "/opt/homebrew/opt/spaceship/spaceship.zsh"

# zprof
# vim:set ft=sh:
