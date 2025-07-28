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

source $ZSH/oh-my-zsh.sh

alias zshconfig="code ~/.zshrc"
alias sourcezsh="source ~/.zshrc"

include "$DOTFILES/zsh/fzf.zsh"

if [[ $(uname) = Darwin ]]; then
  include "$DOTFILES/zsh/thinkific.zsh"
fi
