# ===========
# ZSH Setup
# ===========
#
#

if [[ "$OSTYPE" == "darwin"* ]]; then
    home_dir="/Users/$(whoami)"
elif [[ "$OSTYPE" == "linux"* ]]; then
    home_dir="/home/$(whoami)"
fi

export ZSH="$home_dir/.oh-my-zsh"
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
alias ls='eza --icons=always -1 --hyperlink -l -h --git --no-permissions'
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
alias mux='tmuxinator'

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

export EDITOR="nvim"

# pnpm
export PNPM_HOME="$home_dir/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Expose
export PATH="/$home_dir/.config/composer/vendor/bin:$PATH"

# Mise
eval "$(/$home_dir/.local/bin/mise activate zsh)"

# Laravel Herd / PHP Config
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Herd injected PHP binary.
    export PATH="/Users/tevans/Library/Application Support/Herd/bin/":$PATH

    # Herd injected PHP 8.4 configuration.
    export HERD_PHP_84_INI_SCAN_DIR="/Users/tevans/Library/Application Support/Herd/config/php/84/"
elif [[ "$OSTYPE" == "linux"* ]]; then
    export PATH="$home_dir/.config/herd-lite/bin:$PATH"
    export PHP_INI_SCAN_DIR="/$home_dir/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
fi
