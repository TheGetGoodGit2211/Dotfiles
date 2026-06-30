set -l cachy_cfg /usr/share/cachyos-fish-config/cachyos-config.fish
if test -f $cachy_cfg
    source $cachy_cfg
end

if not command -q paru
    sudo pacman -S --needed base-devel
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd ..
    rm -r paru/
end

if not command -q nvim
    echo "[dotfiles] neovim not found, bootstrapping neovim..."
    paru -S neovim-nightly
end

if not command -q git
    echo "[dotfiles] git not found, bootstrapping git..."
    sudo pacman -S git
end

if not command -q cargo
    echo "[dotfiles] cargo not found, bootstrapping rustup..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
end

if not command -q uv
    echo "[dotfiles] uv not found, installing via cargo..."
    cargo install uv
end

set -l base_venv "$HOME/.venv/base"
if not test -d $base_venv
    echo "[dotfiles] base venv missing, creating with uv..."
    uv venv $base_venv
end

if test -f "$base_venv/bin/activate.fish"
    source "$base_venv/bin/activate.fish"
else
    echo "[dotfiles] Warning: base venv activation script missing"
end

if not command -q zoxide
    echo "[dotfiles] zoxide not found, bootstrapping zoxide..."
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
end

fish_add_path -U "$HOME/.cargo/bin" "$HOME/.local/bin"

zoxide init fish --cmd cd | source
