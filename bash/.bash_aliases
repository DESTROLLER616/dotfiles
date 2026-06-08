# Command neccesary to restart wifi
alias up-wifi='sudo modprobe -r mt7921e && sudo modprobe mt7921e'

# Aliases for lsd plugin
alias l='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias lt='lsd --tree'

# nvim binary location path
alias nvim='$HOME/.local/bin/nvim'

# Alias neccesary to execute lazygit 
alias lg='lazygit' >> ~/.bashrc

# Implement alias to make navigation more affordable
alias cdu='cd $HOME'
alias cdc='cd $HOME/.config'

# Implement an alias to clear console with a shot hand command
alias cls='clear'

# Implementation for apps that dont have an icon

alias firefox-dev='/home/destroller/Documents/Apps/firefox/firefox &'
alias godot='$HOME/Documents/Apps/godot/Godot_v4.6.3-stable_linux.x86_64'
