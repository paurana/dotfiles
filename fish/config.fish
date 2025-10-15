export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export WINIT_UNIX_BACKEND=x11

abbr -a tmux 'tmux -u'

alias vim="nvim"
alias python="python3"

if command -v exa > /dev/null
	abbr -a ls 'exa'
else
	abbr -a l 'ls'
end


bind \co 'set old_tty (stty -g); stty sane; lfcd; stty $old_tty; commandline -f repaint'
function lfcd 
    cd "$(command lf -print-last-dir $argv)"
end