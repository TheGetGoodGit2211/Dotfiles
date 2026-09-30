set -l cargo_env "$HOME/.cargo/env.fish"

if test -f $cargo_env
    source "$HOME/.cargo/env.fish"
end
