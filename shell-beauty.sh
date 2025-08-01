#!/bin/bash

# Update hệ thống
sudo apt update && sudo apt upgrade -y

# 1. Cài Kitty (terminal GPU mượt)
sudo apt install -y kitty

# 2. Cài Zsh và Oh-My-Zsh
sudo apt install -y zsh curl git
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# 3. Đặt Zsh làm shell mặc định
chsh -s $(which zsh)

# 4. Cài plugin Zsh
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

# 5. Cài theme Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# 6. Config .zshrc
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
sed -i 's/plugins=(.*)/plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# 7. Config Kitty (theme + font)
mkdir -p ~/.config/kitty
cat > ~/.config/kitty/kitty.conf << 'EOF'
font_family      FiraCode Nerd Font
font_size        14.0
background_opacity 0.9
enable_audio_bell no

# Colorscheme (Dracula)
include https://raw.githubusercontent.com/dracula/kitty/master/dracula.conf

# Split & tab
map ctrl+shift+enter new_window
map ctrl+shift+t new_tab
map ctrl+shift+left previous_tab
map ctrl+shift+right next_tab
EOF

# 8. Cài font FiraCode Nerd Font
mkdir -p ~/.local/share/fonts
wget -qO- https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip -O /tmp/FiraCode.zip
unzip -o /tmp/FiraCode.zip -d ~/.local/share/fonts
fc-cache -fv

echo "✅ Cài đặt hoàn tất! Hãy logout/login rồi mở Kitty."
