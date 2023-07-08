# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# PATHS #
#########

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ENVIRONMENT VARIABLES #
#########################

export EDITOR="vim"
export VIMCONFIG="$HOME/.vim"
export VIMDATA="$HOME/.vim"

# Load completions for Ruby, Git, etc.
autoload compinit && compinit -C

# Make git completions not be ridiculously slow
__git_files () {
  _wanted files expl 'local files' _files
}

# rbenv setup
eval "$(rbenv init - zsh)"

export EDITOR="vim"

# Color LS output to differentiate between directories and files
export LS_OPTIONS="--color=auto"
export CLICOLOR="Yes"
export LSCOLOR=""

# turn off case sensitivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

# ALIASES #
###########

# Standard Shell
alias configshell='vim ~/.zshrc'
alias c='clear'
alias l='ls -al'
alias bloat='du -k | sort -nr | more'
alias sc='systemctl'
alias jc='journalctl'
alias ..='cd ..'
alias ...='cd ...'
alias /='cd /'
alias ~='cd ~'

# Bundle Exec
alias be="bundle exec"

# Git
alias gs='git status -sb'
alias ga='git add --all'
alias gb='git branch'
alias gcm='git commit -m'
alias gcma='git commit -am'
alias gp='git push'
alias gco='git checkout'
alias gcob='git checkout -b'
alias grpr='git remote prune origin'
alias glog='git log --oneline --decorate --color --graph'
alias glog10='git log --oneline --decorate --color --graph -10'
alias glog100='git log --oneline --decorate --color --graph -100'
alias gloga='git log --oneline --decorate --color --graph --all'

# Docker
alias de='docker exec'
alias dclean='docker ps -a -q -f status=exited | xargs -t docker rm'
alias diclean='docker images -q -f dangling=true | xargs -t docker rmi'
alias dvclean='docker volume ls -q -f dangling=true | xargs -t docker volume rm'
alias dgc='dclean && diclean && dvclean'
alias dps='docker ps'
alias dstop='docker stop `docker ps -q`'

# Docker Compose
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcr='docker-compose run --rm'

# Homebrew
alias bubc='brew upgrade && brew cleanup'

# Flush DNS Cache
alias dnsflush='dscacheutil -flushcache; sudo killall -HUP mDNSResponder'

# Reload SHELL
alias r='exec $SHELL'
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# Personal productivity
alias configvim='vim ~/.config/nvim/init.vim'
alias configvimlua='vim ~/.config/nvim/lua/plugins.lua'
alias pfzf='fzf --preview "bat --style numbers,changes --color=always {} | head -500"'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -d "$HOME/.tea" && source <("$HOME/.tea/tea.xyz/v*/bin/tea" --magic=zsh --silent)
