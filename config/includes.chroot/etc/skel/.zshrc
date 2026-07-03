# Linux HR default zsh config

export TERM="xterm-256color"

autoload -Uz colors && colors

# prompt: root@linux-hr in green, path in cyan
PROMPT='%F{green}┌──(%n@%m)%f-[%F{cyan}%~%f]
%F{green}└─%#%f '

alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias grep='grep --color=auto'
alias matrix='cmatrix -b -C green'
alias sysinfo='neofetch'

HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS SHARE_HISTORY

if [ -f /etc/linux-hr-banner ]; then
  cat /etc/linux-hr-banner
fi
