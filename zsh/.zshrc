# ===========
# ZSH Setup
# ===========
#
export ZSH="/home/tevans/.oh-my-zsh"
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
alias gc="git commit"
alias gp="git push"
alias gti="git"
alias gd="git diff HEAD"
alias gpom="git push origin master && git push origin --tags"
alias lg="git log --oneline --graph --color"
alias cl='clear'
alias so='. ~/.zshrc'
alias viz='vim ~/.zshrc'
alias vib='vim ~/.bookmarks'
alias vis='vim ~/.ssh/config'
alias vih='vim ~/.config/hypr/hyprland.conf'
alias vin='cd ~/.config/nvim && vim'

# Bookmark navigation
function bm {
    if [[ -f ~/.bookmarks ]]; then
        local selected=$(cat ~/.bookmarks | fzf --height=40% --reverse --prompt="Select bookmark: ")
        if [[ -n "$selected" ]]; then
            # Use eval to expand tilde properly
            eval "cd $selected"
        fi
    else
        echo "No bookmarks file found at ~/.bookmarks"
    fi
}

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
alias pas='php artisan serve --host=0.0.0.0 --port=8000'
alias npm="pnpm"
alias plog="vim ./storage/logs/laravel.log"
alias rlog="rm ./storage/logs/laravel.log"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# pnpm
export PNPM_HOME="/home/tevans/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH="/home/tevans/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/tevans/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# Expose
export PATH="/home/tevans/.config/composer/vendor/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
eval "$(/home/tevans/.local/bin/mise activate zsh)"
