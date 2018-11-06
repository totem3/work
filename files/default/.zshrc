PROMPT='%{[38;5;82m%}%M:%n:%c%{[0m%}: $ '
RPROMPT="[%T]"

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt hist_ignore_all_dups
setopt share_history
setopt hist_reduce_blanks
setopt inc_append_history
setopt hist_no_store


export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# . ~/.zshrc.d/*
