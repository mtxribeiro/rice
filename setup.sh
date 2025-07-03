#!/bin/bash

echo "Restaurando o rice..."

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

if [ ! -f "rice-packages.txt" ] || [ ! -f "rice-aur-packages.txt" ]; then
  echo "Erro: arquivos de pacotes não encontrados no diretório atual."
  exit 1
fi

echo "Instalando pacotes principais..."
sudo pacman -S --needed - <rice-packages.txt

echo "Instalando pacotes do AUR..."
if ! command -v yay &>/dev/null; then
  echo "yay não encontrado. Instalando yay..."
  git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd ..
fi
yay -S --needed --noconfirm - <rice-aur-packages.txt

echo "Copiando configurações..."
cp -rf .tmux.conf ~/
cp -rf .config ~/
cp -rf .themes ~/
cp -rf .local ~/
cp -rf Wallpapers ~/Imagens/ 2>/dev/null || mkdir -p ~/Imagens && cp -rf Wallpapers ~/Imagens/
cp .bashrc ~/ 2>/dev/null || true
cp .gtkrc-2.0 ~/ 2>/dev/null || true

echo "Atualizando cache de fontes e diretórios..."
fc-cache -rv
xdg-user-dirs-update

echo "Rice restaurado com sucesso."
