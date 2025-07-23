#!/bin/bash

# Check if WINE exists or not
if [ -x /usr/bin/wine ]
then
    WINE=/usr/bin/wine
    wineserver -k
else
    echo "Đang cài đặt Wine !!!"
    sudo apt install wine
fi

echo "Downloading innoup-2 from GitHub..."
rm -rf temp > /dev/null 2>&1
mkdir temp
cd temp
wget https://github.com/jrathlev/InnoUnpacker-Windows-GUI/raw/refs/heads/master/innounp-2/bin/innounp-2.zip -q --show-progress
echo "Extracting..."
unzip -o innounp-2.zip
rm -rf innounp-2.zip
rm Unpack.ico
echo "Đang tải bản Lotus Chat v3.8.8..."
wget https://lotuspc.mediacdn.vn/LotusUpdater/win/setup/Setup_LChat_v3.8.8.exe -q --show-progress
echo "Giải nén bộ cài đặt..."
$WINE innounp.exe -m Setup_LChat_v3.8.8.exe -e

# Create directory from main WINE prefix
sudo rm -rf /opt/lotuschat/ > /dev/null 2>&1
sudo mkdir /opt/lotuschat/ > /dev/null 2>&1

# Copy icon to icons dir
sudo cp -f ~/lotuschat-wine/lotus_ic.png /opt/lotuschat/

# Copy launcher to application list
chmod 755 ~/lotuschat-wine/LotusChat.desktop
cp -f ~/lotuschat-wine/LotusChat.desktop ~/.local/share/applications

# Copy files to lotuschat folder
sudo mv Lotus.exe /opt/lotuschat/
sudo mv Updater.exe /opt/lotuschat/
rm -rf *

echo "Lotus Chat đã được cài đặt thành công tại /opt/lotuschat] !!"
echo "Xoá Lotus chat: rm [/opt/lotuschat] folder..."
echo "For login/cache data, remove [~/wine/drive_c/users/{username}/AppData/Roaming/Lotus Chat]..." 

