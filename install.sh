#!/usr/bin/env bash
set -e

echo "✨ Installing Beautiful Bash Environment..."

# Update packages
sudo apt update -y && sudo apt upgrade -y

# Install base tools
sudo apt install -y git curl wget unzip zip \
  bat lsd fzf tldr fonts-powerline

# Install zoxide (smart cd)
echo "📦 Installing zoxide..."
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# Install starship (beautiful prompt)
echo "📦 Installing starship..."
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Config starship
mkdir -p ~/.config
cat > ~/.config/starship.toml <<'EOF'
add_newline = true

[character]
success_symbol = "[➜](bold green)"
error_symbol = "[✗](bold red)"

[git_branch]
symbol = "🌱 "
style = "bold yellow"

[git_status]
style = "bold red"

[time]
disabled = false
format = "🕒 [$time]($style) "
style = "bold blue"
EOF

# Setup bashrc
echo 'eval "$(starship init bash)"' >> ~/.bashrc
echo 'eval "$(zoxide init bash)"' >> ~/.bashrc
echo 'alias cat="batcat"' >> ~/.bashrc
echo 'alias ls="lsd -lh --group-dirs first"' >> ~/.bashrc
echo 'alias ll="lsd -alh --group-dirs first"' >> ~/.bashrc

# Reload bashrc
source ~/.bashrc

echo "✅ Done! Restart your terminal to see Beautiful Bash 🎉"
