#!/bin/bash

installLotusChat() {
    LOTUS_DIR="/opt/lotuschat"
    DESKTOP_ENTRY_PATH="$HOME/.local/share/applications/lotuschat.desktop"
    ICON_URL="https://github.com/sonnam0904/linux/blob/main/lotus_ic.png?raw=true"
    ICON_PATH="/opt/lotuschat/lotus.png"
    SETUP_URL="https://lotuspc.mediacdn.vn/LotusUpdater/win/setup/Setup_LChat_v3.9.4.exe"

    echo "🔧 Checking wine..."
    if ! command -v wine &>/dev/null; then
        echo "🚀 Installing wine..."
        sudo apt update && sudo apt install -y wine
    fi

    echo "📦 Checking innoextract..."
    if ! command -v innoextract &>/dev/null; then
        echo "🚀 Installing innoextract..."
        sudo apt install -y innoextract
    fi

    echo "📥 Downloading Lotus Chat installer..."
    mkdir -p /tmp/lotuschat
    cd /tmp/lotuschat || exit
    curl -LO "$SETUP_URL"

    echo "📂 Extracting Lotus Chat installer with innoextract..."
    innoextract Setup_LChat_v3.9.4.exe

    if [[ ! -f app/Lotus.exe ]]; then
        echo "❌ Extraction failed: Lotus.exe not found!"
        exit 1
    fi

    echo "📁 Installing to $LOTUS_DIR..."
    sudo rm -rf "$LOTUS_DIR"
    sudo mkdir -p "$LOTUS_DIR"
    sudo mv app/Lotus.exe app/Updater.exe "$LOTUS_DIR"

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
