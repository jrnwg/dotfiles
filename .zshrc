(( ${+commands[direnv]} )) && emulate zsh -c "$(direnv hook zsh)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# History size
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=10000

# Behavior
setopt append_history          # append to the history file, don't overwrite it
setopt extended_history        # include timestamps
setopt share_history           # share history between all sessions
setopt hist_expire_dups_first  # remove oldest duplicates first when trimming
setopt hist_ignore_dups        # don’t store duplicate lines
setopt hist_ignore_space       # commands starting with space won’t be stored
setopt hist_verify             # show command after expansion before running

# Keybindings
bindkey -e
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[3~' delete-char

# Load completions
autoload -Uz compinit && compinit

# # Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:*' use-fzf-default-opts yes

[ -f ~/.config/fzf/colors.sh ] && source ~/.config/fzf/colors.sh

# nvim
if command -v nvim >/dev/null; then
  export EDITOR='nvim'
  alias vim='nvim'
else
  export EDITOR='vim'
fi
export VISUAL=$EDITOR
export PAGER=less
export LESS='-R'

## ls
alias ls='ls --color=auto'
alias l='ls -lh'
alias la='ls -lhA'

# cd
alias ..='cd ..'

# grep
alias grep='grep --color=auto'

alias tls='tmux ls'
alias tn='tmux new -s'
alias ta='tmux attach -t'
alias tk='tmux kill-session -t'
alias tp='tmuxp'

# git
alias gs='git s'
alias gb='git b'
alias gd='git d'
alias gds='git ds'
alias ga='git a'
alias gc='git c'
alias gco='git co'
alias gp='git p'
alias gl='git l'
alias gls='git ls'

alias lg='lazygit'
alias lazydot='lazygit -g ~/.dotfiles.git -w ~'

compdef dot=git

# Shell integrations
eval "$(fzf --zsh)"
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
