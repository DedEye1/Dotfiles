# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dedeye/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
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
export DOTFILES=$HOME/dotfiles

NEWLINE=$'\n'
PROMPT="${PROMPT}${NEWLINE}"

fastfetch

alias ls='lsd -lag'
alias niriconf='nvim $DOTFILES/niri/config.kdl'
alias zshconf='nvim $DOTFILES/.zshrc'
alias zshreload='source $HOME/.zshrc'
alias kittyconf='nvim $DOTFILES/kitty/kitty.conf'
alias cddotfiles='cd $DOTFILES'
alias yazi='y'

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}
