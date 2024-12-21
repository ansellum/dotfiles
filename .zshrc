# Which plugins would you like to load?
plugins=(
    git
    archlinux
    zsh-autosuggestions
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

# Kill shortcut
alias pk='pkill -f -9'

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

eval "$(starship init zsh)"
