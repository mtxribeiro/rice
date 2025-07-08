#!/bin/bash

echo "Clonando repositórios..."

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

echo "Instalando pacotes principais..."
sudo pacman -S --needed git base-devel polkit-kde-agent make unzip unrar gcc pavucontrol btop rofimoji xorg-xwayland tmux neovim fastfetch kitty rofi-wayland nwg-bar nautilus qt5-wayland qt6-wayland xdg-desktop-portal-gtk xdg-desktop-portal-hyprland mpv xdg-user-dirs-gtk ttf-firacode-nerd noto-fonts-emoji gnome-keyring breeze breeze5 breeze-gtk hyprlock hyprpicker waybar

echo "Instalando pacotes do AUR..."
if ! command -v yay &>/dev/null; then
  echo "yay não encontrado. Instalando yay..."
  git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd ..
fi
rm -rf yay
yay -S --needed --noconfirm hyprshot qview brave-bin asdf-vm qt5ct-kde qt6ct-kde swww

echo "Copiando configurações..."
cp -rf .tmux.conf ~/
cp -rf .config ~/
cp -rf .themes ~/
cp -rf .local ~/
cp .bashrc ~/ 2>/dev/null || true
cp .gtkrc-2.0 ~/ 2>/dev/null || true
mkdir -p ~/Imagens && cp -rf Wallpapers ~/Imagens/

echo "Atualizando cache de fontes e diretórios..."
fc-cache -rv
xdg-user-dirs-update

echo "Rice restaurado com sucesso."
