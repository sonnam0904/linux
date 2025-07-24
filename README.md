# Lotus Chat cho WINE (Linux)

- Script này sẽ tải về, giải nén và cài đặt Lotus Chat bản Windows vào thư mục `/opt/lotuschat` và chạy bằng **WINE với user prefix** (không dùng Bottle).

## Tại sao cần script này?

- Trình cài đặt chính thức của Lotus Chat luôn bị lỗi khi chạy bằng WINE.
- Cách duy nhất để cài và chạy được là **giải nén file cài đặt**, rồi chạy trực tiếp file `.exe` bên trong.

## Cách sử dụng

Clone repo rồi chạy script (yêu cầu `sudo` để ghi vào `/opt`):

```bash
sudo curl -O https://raw.githubusercontent.com/sonnam0904/linux/main/lotus.sh
chmod +x lotus.sh
./lotus.sh
```

Script sẽ tự động:

- Tải trình cài đặt Lotus Chat và công cụ `innounp` vào thư mục `temp`
- Giải nén và copy `Lotus.exe` và `Updater.exe` vào `/opt/lotuschat/`
- Thêm shortcut `LotusChat.desktop` vào danh sách ứng dụng người dùng

Chạy bằng:

```bash
wine /opt/lotuschat/Lotus.exe
```

Hoặc tìm trong menu ứng dụng.  
**Xài thôi 😎**

# Cài đặt Cursor AI IDE

Cài đặt bằng script có sẵn:

```bash
curl -O https://raw.githubusercontent.com/sonnam0904/linux/main/cursor.sh
chmod +x cursor.sh
./cursor.sh
```

Script sẽ:

- Tải Cursor AppImage về thư mục `/opt/`
- Tải icon và tạo shortcut `Cursor AI IDE` trong menu ứng dụng
- Có thể chạy từ menu hoặc gõ:

```bash
/opt/cursor.appimage --no-sandbox
```
# Cài đặt tất cả các tool: 

```bash
curl -O https://raw.githubusercontent.com/sonnam0904/linux/main/install_all.sh
chmod +x install_all.sh
./install_all.sh

```

# Cài đặt Shell bash beauty

Cài đặt bằng script có sẵn:

```bash
curl -O https://raw.githubusercontent.com/sonnam0904/linux/main/shell-beauty.sh
chmod +x shell-beauty.sh
./shell-beauty.sh

```

Script sẽ:
- Cài đặt Zsh + Oh My Zsh + Starship + Plugin
- Hoạt động tốt trên Ubuntu / Pop!_OS / Debian-based

- Logout rồi login lại (quan trọng!)
- Việc đổi shell chỉ áp dụng khi bạn mở session mới → nên bạn cần:

- Đăng xuất khỏi user rồi đăng nhập lại hoặc Khởi động lại máy

# Gỡ cài đặt Cursor

```bash
sudo rm /opt/cursor.appimage /opt/cursor.png
rm ~/.local/share/applications/cursor.desktop
```

# Gỡ cài đặt Lotus Chat

```bash
sudo rm -rf '/opt/lotuschat/'
sudo rm -rf '~/.wine/drive_c/users/{username}/AppData/Roaming/Lotus Chat'
sudo rm ~/.local/share/applications/LotusChat.desktop
```

## Ghi nhận đóng góp

- [Lotus Chat](https://lotuschat.vn) — Bản cài cho Windows  
- [Jürgen Rathlev](https://github.com/jrathlev/InnoUnpacker-Windows-GUI/blob/master/innounp-2) — Công cụ innounp dùng để giải nén file cài đặt

