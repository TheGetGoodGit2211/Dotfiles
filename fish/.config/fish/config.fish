if not set -q SSH_AUTH_SOCK
    eval (ssh-agent -c)
end

if command -q fnm
    fnm env --use-on-cd --shell fish | source
end

if command -q zoxide
    zoxide init fish --cmd cd | source
end

if test -f ~/.venv/bin/activate.fish
    source ~/.venv/bin/activate.fish
end
