function install-dev-tools -d "Install repo/AUR dev utilities"
    argparse n/non-interactive h/help -- $argv; or return 1
    if set -q _flag_help
        echo "usage: install-dev-tools [-n|--non-interactive]"
        return 0
    end

    set -l pac_flags
    if set -q _flag_non_interactive; or not status is-interactive
        set pac_flags --noconfirm
    else
        read -l -P "[dotfiles] run non-interactively (no prompts)? [y/N] " ans
        string match -qr '^[Yy]' -- $ans; and set pac_flags --noconfirm
    end

    sudo -v; or begin
        echo "[dotfiles] sudo authentication failed" >&2
        return 1
    end

    if not string match -q -- /usr/bin/fish $SHELL
        test -x /usr/bin/fish; or begin
            echo "[dotfiles] /usr/bin/fish missing; install fish first" >&2
            return 1
        end
        sudo usermod --shell /usr/bin/fish -- $USER; or return 1
    end

    fish_add_path -U $HOME/.local/bin

    # Bootstrap build toolchain + a working Cargo provider before building paru.
    sudo pacman -S --needed $pac_flags base-devel git rustup; or return 1

    if command -q rustup
        rustup default stable; or return 1
    end

    if not command -q paru
        set -l tmp (mktemp -d)
        pushd $tmp >/dev/null; or return 1

        git clone --depth 1 https://aur.archlinux.org/paru.git
        or begin
            popd >/dev/null
            rm -rf $tmp
            return 1
        end

        pushd paru >/dev/null
        or begin
            popd >/dev/null
            rm -rf $tmp
            return 1
        end

        makepkg -si $pac_flags
        set -l mkrc $status

        popd >/dev/null
        popd >/dev/null
        rm -rf $tmp
        test $mkrc -eq 0; or return 1
    end

    sudo -v; or return 1
    paru -S --needed $pac_flags fnm zoxide fzf uv neovim-nightly-bin; or return 1

    if command -q fnm
        fnm install --lts; or return 1
        fnm default lts-latest; or return 1
    end

    echo "[dotfiles] done; open a new shell for fnm/zoxide hooks"
end
