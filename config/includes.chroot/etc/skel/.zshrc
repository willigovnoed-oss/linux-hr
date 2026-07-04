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
alias cat='batcat --paging=never 2>/dev/null || cat'
alias ls='exa --color=auto 2>/dev/null || ls --color=auto'
alias find='rg --files 2>/dev/null || find'
alias dashboard='hr'

HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS SHARE_HISTORY

# fuzzy history search / file search, if fzf is installed
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh

# zsh plugins, if installed via apt
[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# dashboard on login (interactive shells only)
if [[ $- == *i* ]] && command -v hr >/dev/null 2>&1; then
  hr
fi
