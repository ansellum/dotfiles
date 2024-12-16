# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting   
)

source $ZSH/oh-my-zsh.sh

# Detect the AUR wrapper
if pacman -Qi yay &>/dev/null ; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null ; then
   aurhelper="paru"
fi

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
pokemon-colorscripts -r 1-5

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

autoload zmv

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

# Environment Variables
export EDITOR=nvim
export VISUAL=nvim

eval "$(starship init zsh)"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/marche/.dart-cli-completion/zsh-config.zsh ]] && . /home/marche/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


# Created by `pipx` on 2024-09-05 01:58:01
export PATH="$PATH:/home/marche/.local/bin"
export SteamDeck=1
