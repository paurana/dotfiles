export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export WINIT_UNIX_BACKEND=x11

abbr -a tmux 'tmux -u'

alias vim="nvim"
alias oldvim="command vim"
alias python="python3"

# better way to bind exa, also better bindings
if command -v exa > /dev/null
	abbr -a l 'exa'
	abbr -a ls 'exa'
	abbr -a ll 'exa -l'
	abbr -a lll 'exa -la'
else
	abbr -a l 'ls'
	abbr -a ll 'ls -l'
	abbr -a lll 'ls -la'
end

# function _trap_exit
#         set name $(tmux display-message -p '#S')
#        tmux kill-session -t name
# end

# trap _trap_exit EXIT
