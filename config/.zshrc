ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-completions

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^E" edit-command-line

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

alias ls='ls --color'

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(atuin init zsh)"

export FZF_DEFAULT_OPTS="
--color=fg:#cdcdcd
--color=bg:#141415
--color=hl:#f3be7c
--color=fg+:#aeaed1
--color=bg+:#252530
--color=hl+:#f3be7c
--color=border:#606079
--color=header:#6e94b2
--color=gutter:#141415
--color=spinner:#7fa563
--color=info:#f3be7c
--color=pointer:#aeaed1
--color=marker:#d8647e
--color=prompt:#bb9dbd"
