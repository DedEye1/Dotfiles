export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

bindkey '^H' backward-kill-word
export EDITOR='code'

NEWLINE=$'\n'
PROMPT="${PROMPT}${NEWLINE}"

alias ls='lsd -lag'
alias niriconf='nvim $HOME/dotfiles/niri/config.kdl'
alias zshconf='nvim $HOME/dotfiles/.zshrc'
alias kittyconf='nvim $HOME/dotfiles/kitty/kitty.conf'
alias dotfiles='cd $HOME/dotfiles'
alias yazi='y'

fastfetch

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}
