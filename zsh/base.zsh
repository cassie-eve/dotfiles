# Include other scripts if they exist on the system
include() {
  [[ -f "$1" ]] && source "$1" || echo "ERROR loading ${1}"
}

export DOTFILES="$HOME/dotfiles"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="crunch"
zstyle ':omz:update' mode auto      # update automatically without asking

ZSH_AUTOSUGGEST_STRATEGY=(completion)

plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-fzf-history-search)

# keep oh-my-zsh cache files in the same place as the rest of the dotfiles
ZSH_COMPDUMP="${ZSH_CACHE_DIR:-$HOME/.oh-my-zsh/cache}/.zcompdump-${HOST}-${ZSH_VERSION}"

source $ZSH/oh-my-zsh.sh

alias zshconfig="code ~/.zshrc"
alias sourcezsh="source ~/.zshrc"

# Load fzf shell key bindings and completion from brew-installed location
if [ -f "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh" ]; then
  source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
fi

if [ -f "$(brew --prefix)/opt/fzf/shell/completion.zsh" ]; then
  source "$(brew --prefix)/opt/fzf/shell/completion.zsh"
fi

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

if [[ $(uname) = Darwin ]]; then
  include "$DOTFILES/zsh/thinkific.zsh"
fi

# Thinkific dev environment runner
alias thinkdev="cd ~/Thinkific/workspace/thinkific-env && ./run-dev.sh"

# Use 1Password SSH agent
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
