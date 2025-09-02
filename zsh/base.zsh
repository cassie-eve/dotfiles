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

if [[ $(uname) = Darwin ]]; then
  include "$DOTFILES/zsh/thinkific.zsh"
fi
