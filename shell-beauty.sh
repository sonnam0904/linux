#!/bin/bash

echo "🌟 Bắt đầu setup shell đẹp... (Zsh + Oh-My-Zsh + Starship)"

# Cài zsh nếu chưa có
if ! command -v zsh &> /dev/null; then
    echo "👉 Installing zsh..."
    sudo apt update && sudo apt install -y zsh
fi

# Đặt zsh làm shell mặc định
chsh -s $(which zsh)

# Cài Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "⚙️ Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Cài plugin autosuggestions
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    echo "✨ Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# Cài plugin syntax highlighting
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    echo "✨ Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# Bật plugin trong .zshrc
sed -i 's/plugins=(.*)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# Cài Starship prompt
if ! command -v starship &> /dev/null; then
    echo "🚀 Installing Starship prompt..."
    curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

# Gắn starship vào .zshrc nếu chưa có
if ! grep -q 'eval "$(starship init zsh)"' ~/.zshrc; then
    echo 'eval "$(starship init zsh)"' >> ~/.zshrc
fi

# Cấu hình starship đơn giản
mkdir -p ~/.config
cat <<EOF > ~/.config/starship.toml
add_newline = false

[character]
success_symbol = "[➜](bold green) "

[git_branch]
symbol = "🌱 "

[directory]
truncation_length = 3
EOF

echo "✅ Xong! Khởi động lại terminal hoặc gõ: exec zsh"


