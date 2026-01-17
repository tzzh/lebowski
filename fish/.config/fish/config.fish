~/.local/bin/mise activate fish | source
if status is-interactive
    # Commands to run in interactive sessions can go here
    fzf --fish | source
    set -g fish_key_bindings fish_vi_key_bindings
end
