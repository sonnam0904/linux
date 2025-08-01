#!/bin/bash

installLotusChat() {
    LOTUS_DIR="/opt/lotuschat"
    DESKTOP_ENTRY_PATH="$HOME/.local/share/applications/lotuschat.desktop"
    ICON_URL="https://github.com/sonnam0904/linux/blob/main/lotus_ic.png?raw=true"
    ICON_PATH="/opt/lotuschat/lotus.png"
    SETUP_URL="https://lotuspc.mediacdn.vn/LotusUpdater/win/setup/Setup_LChat_v3.8.8.exe"
    INNOUNP_URL="https://github.com/jrathlev/InnoUnpacker-Windows-GUI/raw/refs/heads/master/innounp-2/bin/innounp-2.zip"

    echo "🔧 Checking wine..."
    if ! command -v wine &>/dev/null; then
        echo "🚀 Installing wine..."
        sudo apt update && sudo apt install -y wine
    fi

    echo "📦 Downloading innounp..."
    mkdir -p /tmp/lotuschat
    cd /tmp/lotuschat || exit
    curl -LO "$INNOUNP_URL"
    unzip -o innounp-2.zip
    rm innounp-2.zip Unpack.ico

    echo "📥 Downloading Lotus Chat setup..."
    curl -LO "$SETUP_URL"

    echo "📂 Extracting Lotus Chat installer..."
    wine innounp.exe -m Setup_LChat_v3.8.8.exe -e

    echo "📁 Installing to $LOTUS_DIR..."
    sudo rm -rf "$LOTUS_DIR"
    sudo mkdir -p "$LOTUS_DIR"
    sudo mv Lotus.exe Updater.exe "$LOTUS_DIR"

    echo "🖼️ Downloading icon..."
    sudo curl -L "$ICON_URL" -o "$ICON_PATH"

    echo "🧷 Creating desktop shortcut..."
    mkdir -p "$(dirname "$DESKTOP_ENTRY_PATH")"
    cat > "$DESKTOP_ENTRY_PATH" <<EOL
[Desktop Entry]
Name=Lotus Chat
Exec=bash -c 'env WINEPREFIX="$HOME/.wine" wine /opt/lotuschat/Lotus.exe'
Type=Application
StartupNotify=true
Icon=/opt/lotuschat/lotus.png
StartupWMClass=lotus.exe
Categories=Network;Chat;
EOL

    echo "✅ Lotus Chat installed! You can find it in your app menu."
}

installLotusChat

