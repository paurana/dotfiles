if status is-interactive
end

export PATH="$HOME/.cargo/bin:$PATH"
export WINIT_UNIX_BACKEND=x11

abbr -a tmux 'tmux -u'

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

function _trap_exit
        set name $(tmux display-message -p '#S')
        tmux kill-session -t name
end

trap _trap_exit EXIT
