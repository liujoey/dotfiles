#
# Defines Git aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Settings
#
#

# Log
zstyle -s ':prezto:module:git:log:medium' format '_git_log_medium_format' \
  || _git_log_medium_format='%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'
zstyle -s ':prezto:module:git:log:oneline' format '_git_log_oneline_format' \
  || _git_log_oneline_format='%C(green)%h%C(reset) %s%C(red)%d%C(reset)%n'
zstyle -s ':prezto:module:git:log:brief' format '_git_log_brief_format' \
  || _git_log_brief_format='%C(green)%h%C(reset) %s%n%C(blue)(%ar by %an)%C(red)%d%C(reset)%n'

# Status
zstyle -s ':prezto:module:git:status:ignore' submodules '_git_status_ignore_submodules' \
  || _git_status_ignore_submodules='none'

#
# Aliases
#

# Layzgit
alias lg='lazygit'

# Git
alias g='git'

# Branch (b)
alias gb='g branch'
alias gba='g branch --all --verbose'
alias gbc='g checkout -b'
alias gbd='g branch --delete'
alias gbD='g branch --delete --force'
alias gbl='g branch --verbose'
alias gbL='g branch --all --verbose'
alias gbm='g branch --move'
alias gbM='g branch --move --force'
alias gbr='g branch --move'
alias gbR='g branch --move --force'
alias gbs='g show-branch'
alias gbS='g show-branch --all'
alias gbv='g branch --verbose'
alias gbV='g branch --verbose --verbose'
alias gbx='g branch --delete'
alias gbX='g branch --delete --force'

# Commit (c)
alias gc='g commit --verbose'
alias gca='g commit --verbose --all'
alias gcm='g commit --message'
alias gcS='g commit -S --verbose'
alias gcSa='g commit -S --verbose --all'
alias gcSm='g commit -S --message'
alias gcam='g commit --all --message'
# alias gco='g checkout'
alias gcO='g checkout --patch'
# alias gcf='g commit --amend --reuse-message HEAD'
alias gcSf='g commit -S --amend --reuse-message HEAD'
alias gcF='g commit --verbose --amend'
alias gcSF='g commit -S --verbose --amend'
# alias gcp='g cherry-pick --ff'
alias gcP='g cherry-pick --no-commit'
alias gcr='g revert'
alias gcR='g reset "HEAD^"'
alias gcs='g show'
alias gcsS='g show --pretty=short --show-signature'
alias gcl='g-commit-lost'
alias gcy='g cherry -v --abbrev'
alias gcY='g cherry -v'

# Conflict (C)
alias gCl='g --no-pager diff --name-only --diff-filter=U'
alias gCa='g add $(gCl)'
alias gCe='g mergetool $(gCl)'
alias gCo='g checkout --ours --'
alias gCO='gCo $(gCl)'
alias gCt='g checkout --theirs --'
alias gCT='gCt $(gCl)'

# Data (d)
# alias gd='g ls-files'
alias gdc='g ls-files --cached'
alias gdx='g ls-files --deleted'
alias gdm='g ls-files --modified'
alias gdu='g ls-files --other --exclude-standard'
alias gdk='g ls-files --killed'
alias gdi='g status --porcelain --short --ignored | sed -n "s/^!! //p"'

# Fetch (f)
alias gf='g fetch'
alias gfa='g fetch --all'
alias gfc='g clone'
alias gfcr='g clone --recurse-submodules'
alias gfm='g pull'
alias gfr='g pull --rebase'

# Flow (F)
alias gFi='g flow init'
alias gFf='g flow feature'
alias gFb='g flow bugfix'
alias gFl='g flow release'
alias gFh='g flow hotfix'
alias gFs='g flow support'

alias gFfl='g flow feature list'
alias gFfs='g flow feature start'
alias gFff='g flow feature finish'
alias gFfp='g flow feature publish'
alias gFft='g flow feature track'
alias gFfd='g flow feature diff'
alias gFfr='g flow feature rebase'
alias gFfc='g flow feature checkout'
alias gFfm='g flow feature pull'
alias gFfx='g flow feature delete'

alias gFbl='g flow bugfix list'
alias gFbs='g flow bugfix start'
alias gFbf='g flow bugfix finish'
alias gFbp='g flow bugfix publish'
alias gFbt='g flow bugfix track'
alias gFbd='g flow bugfix diff'
alias gFbr='g flow bugfix rebase'
alias gFbc='g flow bugfix checkout'
alias gFbm='g flow bugfix pull'
alias gFbx='g flow bugfix delete'

alias gFll='g flow release list'
alias gFls='g flow release start'
alias gFlf='g flow release finish'
alias gFlp='g flow release publish'
alias gFlt='g flow release track'
alias gFld='g flow release diff'
alias gFlr='g flow release rebase'
alias gFlc='g flow release checkout'
alias gFlm='g flow release pull'
alias gFlx='g flow release delete'

alias gFhl='g flow hotfix list'
alias gFhs='g flow hotfix start'
alias gFhf='g flow hotfix finish'
alias gFhp='g flow hotfix publish'
alias gFht='g flow hotfix track'
alias gFhd='g flow hotfix diff'
alias gFhr='g flow hotfix rebase'
alias gFhc='g flow hotfix checkout'
alias gFhm='g flow hotfix pull'
alias gFhx='g flow hotfix delete'

alias gFsl='g flow support list'
alias gFss='g flow support start'
alias gFsf='g flow support finish'
alias gFsp='g flow support publish'
alias gFst='g flow support track'
alias gFsd='g flow support diff'
alias gFsr='g flow support rebase'
alias gFsc='g flow support checkout'
alias gFsm='g flow support pull'
alias gFsx='g flow support delete'

# Grep (g)
alias gg='g grep'
alias ggi='g grep --ignore-case'
alias ggl='g grep --files-with-matches'
alias ggL='g grep --files-without-matches'
alias ggv='g grep --invert-match'
alias ggw='g grep --word-regexp'

# Index (i)
alias gia='g add'
alias giA='g add --patch'
alias giu='g add --update'
alias gid='g diff --no-ext-diff --cached'
alias giD='g diff --no-ext-diff --cached --word-diff'
alias gii='g update-index --assume-unchanged'
alias giI='g update-index --no-assume-unchanged'
alias gir='g reset'
alias giR='g reset --patch'
alias gix='g rm -r --cached'
alias giX='g rm -rf --cached'

# Log (l)
alias gl='g log --topo-order --pretty=format:"${_git_log_medium_format}"'
alias gls='g log --topo-order --stat --pretty=format:"${_git_log_medium_format}"'
alias gld='g log --topo-order --stat --patch --full-diff --pretty=format:"${_git_log_medium_format}"'
# alias glo='g log --topo-order --pretty=format:"${_git_log_oneline_format}"'
alias glg='g log --topo-order --all --graph --pretty=format:"${_git_log_oneline_format}"'
alias glb='g log --topo-order --pretty=format:"${_git_log_brief_format}"'
alias glc='g shortlog --summary --numbered'
alias glS='g log --show-signature'

# Merge (m)
alias gm='g merge'
alias gmC='g merge --no-commit'
alias gmF='g merge --no-ff'
alias gma='g merge --abort'
alias gmt='g mergetool'

# Push (p)
alias gp='g push'
alias gpf='g push --force-with-lease'
alias gpF='g push --force'
alias gpa='g push --all'
alias gpA='g push --all && g push --tags'
alias gpt='g push --tags'
alias gpc='g push --set-upstream origin "$(git-branch-current 2> /dev/null)"'
alias gpp='g pull origin "$(git-branch-current 2> /dev/null)" && g push origin "$(git-branch-current 2> /dev/null)"'

# Rebase (r)
alias gr='g rebase'
alias gra='g rebase --abort'
alias grc='g rebase --continue'
alias gri='g rebase --interactive'
alias grs='g rebase --skip'

# Remote (R)
alias gR='g remote'
alias gRl='g remote --verbose'
alias gRa='g remote add'
alias gRx='g remote rm'
alias gRm='g remote rename'
alias gRu='g remote update'
alias gRp='g remote prune'
alias gRs='g remote show'
alias gRb='git-hub-browse'

# Stash (s)
alias gs='g stash'
alias gsa='g stash apply'
alias gsx='g stash drop'
alias gsX='git-stash-clear-interactive'
alias gsl='g stash list'
alias gsL='git-stash-dropped'
alias gsd='g stash show --patch --stat'
alias gsp='g stash pop'
alias gsr='git-stash-recover'
# alias gss='g stash save --include-untracked'
alias gsS='g stash save --patch --no-keep-index'
alias gsw='g stash save --include-untracked --keep-index'

# Submodule (S)
alias gS='g submodule'
alias gSa='g submodule add'
alias gSf='g submodule foreach'
alias gSi='g submodule init'
alias gSI='g submodule update --init --recursive'
alias gSl='g submodule status'
alias gSm='git-submodule-move'
alias gSs='g submodule sync'
alias gSu='g submodule foreach git pull origin master'
alias gSx='git-submodule-remove'

# Tag (t)
alias gt='g tag'
alias gtl='g tag -l'
alias gts='g tag -s'
alias gtv='g verify-tag'

# Working Copy (w)
alias gws='g status --ignore-submodules=${_git_status_ignore_submodules} --short'
alias gwS='g status --ignore-submodules=${_git_status_ignore_submodules}'
alias gwd='g diff --no-ext-diff'
alias gwD='g diff --no-ext-diff --word-diff'
alias gwr='g reset --soft'
alias gwR='g reset --hard'
alias gwc='g clean -n'
alias gwC='g clean -f'
alias gwx='g rm -r'
alias gwX='g rm -rf'
