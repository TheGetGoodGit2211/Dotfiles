function update-dev-tools -d "Update dev tools (repo + AUR + rustup)"
    set -l rc 0

    if command -q rustup
        rustup update; or set rc 1
    else
        echo "[dotfiles] rustup not found, skipping" >&2
    end

    if command -q paru
        sudo -v; or return 1
        paru -Syu --noconfirm --sudoloop; or set rc 1
    else if command -q pacman
        sudo -v; or return 1
        sudo pacman -Syu --noconfirm; or set rc 1
    end

    if command -q fnm
        fnm install --lts; and fnm default lts-latest; or set rc 1
    end

    test $rc -eq 0; or echo "[dotfiles] one or more updates failed" >&2
    return $rc
end
