#!/bin/bash

caiDatCursor() {
    if ! [ -f /opt/cursor.appimage ]; then
        echo "🚀 Bắt đầu cài đặt Cursor AI IDE..."

        # Link tải AppImage và icon
        CURSOR_URL="https://downloads.cursor.com/production/faa03b17cce93e8a80b7d62d57f5eda6bb6ab9fa/linux/x64/Cursor-1.2.2-x86_64.AppImage"
        ICON_URL="https://github.com/sonnam0904/linux/blob/main/cursor.jpg?raw=true"

        # Đường dẫn lưu AppImage và icon
        APPIMAGE_PATH="/opt/cursor/cursor.appimage"
        ICON_PATH="/opt/cursor/cursor.jpg"
        DESKTOP_ENTRY_PATH="/home/$USER/.local/share/applications/cursor.desktop"

        # Cài curl nếu chưa có
        if ! command -v curl &> /dev/null; then
            echo "🛠️ curl chưa được cài. Đang tiến hành cài đặt..."
            sudo apt-get update
            sudo apt-get install -y curl
        fi

        # Tải Cursor AppImage
        echo "⬇️ Đang tải Cursor AppImage..."
        sudo curl -L $CURSOR_URL -o $APPIMAGE_PATH
        # sudo chmod +x $APPIMAGE_PATH

        # Tải icon
        echo "🖼️ Đang tải icon cho Cursor..."
        sudo curl -L $ICON_URL -o $ICON_PATH

        # Tạo file .desktop để thêm vào menu ứng dụng
        echo "📂 Tạo shortcut trong menu ứng dụng..."
        mkdir -p $(dirname $DESKTOP_ENTRY_PATH)
        cat > $DESKTOP_ENTRY_PATH <<EOL
[Desktop Entry]
Name=Cursor AI IDE
Exec=$APPIMAGE_PATH --no-sandbox
Icon=$ICON_PATH
Type=Application
Categories=Development;
EOL

        echo "✅ Cài đặt hoàn tất! Cursor AI IDE đã có trong menu ứng dụng của bạn."
    else
        echo "⚠️ Cursor AI IDE đã được cài trước đó tại /opt/cursor/cursor.appimage."
    fi
}

caiDatCursor

