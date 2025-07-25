#!/bin/bash

echo "🚀 Bắt đầu cài đặt tất cả các tool..."

# 1. Cài đặt Git & openVPN
echo "🛠️ Cài đặt Git..."
sudo apt update
sudo apt install -y git
echo "🛠️ Cài đặt openVPN..."
sudo apt install -y openvpn
echo "🛠️ Cài đặt Telegram desktop..."
sudo apt install telegram-desktop

# 2. Cài đặt ibus-unikey
echo "🇻🇳 Cài đặt ibus-unikey để gõ tiếng Việt..."
sudo apt install -y ibus-unikey
echo "🔁 Khởi động lại ibus..."
ibus restart || echo "⚠️ Vui lòng đăng xuất/đăng nhập lại nếu ibus chưa khởi động đúng."

# 3. Cài đặt Cursor AI IDE
echo "🧠 Cài đặt Cursor AI IDE..."
curl -O https://raw.githubusercontent.com/sonnam0904/linux/main/cursor.sh
chmod +x cursor.sh
./cursor.sh

# 4. Cài đặt Lotus Chat
echo "💬 Cài đặt Lotus Chat cho WINE..."
sudo curl -O https://raw.githubusercontent.com/sonnam0904/linux/main/lotus.sh
chmod +x lotus.sh
./lotus.sh

echo "✅ Hoàn tất cài đặt tất cả các tool!"
echo "Bạn có thể tìm thấy Lotus Chat và Cursor trong menu ứng dụng."

