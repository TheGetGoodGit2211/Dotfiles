function update-dev-tools
    echo "🔄 Updating Rust toolchain..."
    if command -q rustup
        rustup update
    else
        echo "⚠️ rustup not found, skipping."
    end

    echo "🔄 Updating uv..."
    if command -q uv
        cargo install uv
    else
        echo "⚠️ uv not found, skipping."
    end

    echo "🔄 Updating zoxide..."
    if command -q zoxide
        # Re-running the install script is the official way to update the curl install
        curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
    else
        echo "⚠️ zoxide not found, skipping."
    end

    echo "✨ All dev tools updated!"
end
