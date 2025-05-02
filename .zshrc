# AUTOCOMPLETION

# initialize autocompletion
autoload -U compinit
compinit
#unsetopt completealiases

# history setup
setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

# Which plugins would you like to load?
plugins=(
    git
    archlinux
    zsh-syntax-highlighting   
)

# Variables
aurhelper="yay"

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
pokemon-colorscripts -r 1-5

###########
## BINDS ##
###########
bindkey "^[[H"	beginning-of-line
bindkey "^[[F"	end-of-line
bindkey "^[[3~"	delete-char

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# autocompletion using arrow keys (based on history)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

#############
## ALIASES ##
#############

# Config settings
alias zshconfig="nvim ~/.zshrc"
alias hyprconfig="nvim ~/.config/hypr/hyprland.conf"

## Program replacements
alias yeet="$aurhelper -Rns"
alias vim="nvim"
alias vi="nvim"

# Set-up icons for files/folders in terminal
alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --icons'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'

# Command shortcuts
alias pk='pkill -fi -9'
alias poweroff='shutdown -h now'

# grub config
alias grubcfg='sudo grub-mkconfig -o /boot/grub/grub.cfg'

# yt-dlp
alias yt-mp3='yt-dlp  -i --extract-audio --audio-format mp3 --audio-quality 0'

# dotfiles
alias dot='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

###########################
## Environment Variables ##
###########################
export EDITOR=nvim
export VISUAL=nvim
export PATH="$HOME/bin:$PATH"

eval "$(starship init zsh)"
