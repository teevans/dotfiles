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
# K8s Aliases
# ===========
alias k='kubectl'
alias kn='kubens'
alias kc='kubectx'

# ===========
# PHP Aliases
# ===========

alias pa='php artisan'
alias paf='php artisan migrate:fresh --seed'


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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tevans/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tevans/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tevans/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tevans/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# pnpm
export PNPM_HOME="/Users/tevans/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
