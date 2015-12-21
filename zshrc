### zshrc
# By Henrik Lissner <henrik@lissner.net>

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
ZSH_PLUGINS_ALIAS_TIPS_EXPAND=1
ZGEN_AUTOLOAD_COMPINIT=true
[[ "${USER}" == "root" ]] && ZGEN_AUTOLOAD_COMPINIT=false

load zsh/zgen/zgen.zsh
if ! zgen saved; then
    echo "Creating zgen save"
    [[ -d "$CACHE_DIR" ]] && rm -f "$CACHE_DIR/*"

    zgen load StackExchange/blackbox
    zgen load thewtex/tmux-mem-cpu-load
    zgen load djui/alias-tips
    zgen load joepvd/zsh-hints
    zgen load unixorn/git-extra-commands

    zgen load hlissner/zsh-autopair "autopair.zsh"
    zgen load zsh-users/zsh-history-substring-search
    zgen load zsh-users/zsh-completions src
    is-ssh || zgen load zsh-users/zsh-syntax-highlighting

    zgen save
fi

cache rbenv init - --no-rehash
cache pyenv init - --no-rehash
is-interactive && cache fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install

iload zsh/fzf
load  zsh/config
iload zsh/keybinds
iload zsh/prompt
load  zsh/aliases
iload zsh/completion

# Done!
