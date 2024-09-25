# ===========
# ZSH Setup
# ===========
#
export ZSH="/Users/tevans/.oh-my-zsh"
plugins=(
  git
  docker
  github
  tmux
  kubectl
  zsh-autosuggestions
)

ZSH_THEME="amuse"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan'
source $ZSH/oh-my-zsh.sh

path=(
	$HOME/.local/bin
    $path
)

# ===========
# Aliases
# ===========

alias vim="nvim"
alias vi="nvim"
alias ls='ls -al --color=auto'
alias gs="git status"
alias gt="git tag -a"
alias ga="git add ."
alias gc="git commit -m \"CI\""
alias gp="git push"
alias gti="git"
alias gd="git diff HEAD"
alias gpom="git push origin master && git push origin --tags"
alias lg="git log --oneline --graph --color"
alias cl='clear'

# ===========
# PHP Aliases
# ===========

alias pa='php artisan'
alias pafresh='php artisan migrate:fresh --seed'


# ===========
# Herd
# ===========
# Herd injected NVM configuration
export NVM_DIR="/Users/tevans/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"
# Herd injected PHP binary.
export PATH="/Users/tevans/Library/Application Support/Herd/bin/":$PATH
# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/tevans/Library/Application Support/Herd/config/php/83/"
