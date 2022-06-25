if status is-interactive
    #set BASE16_SHELL "$HOME/.config/base16-shell/"
    #source "$BASE16_SHELL/profile_helper.fish"
end

# set fish_function_path $fish_function_path ~/.config/fish/plugin-foreign-env/functions
# fenv source ~/.profile

export PATH="$HOME/.cargo/bin:$PATH"
export WINIT_UNIX_BACKEND=x11

alias ls=exa
alias tmux="tmux -u"
