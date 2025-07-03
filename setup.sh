#!/bin/bash

echo "Restaurando o rice..."

# Verifica se está no diretório correto
if [ ! -f "rice-packages.txt" ] || [ ! -f "rice-aur-packages.txt" ]; then
  echo "Erro: arquivos de pacotes não encontrados no diretório atual."
  exit 1
fi

# 1. Instalar pacotes do repositório oficial
echo "Instalando pacotes principais..."
sudo pacman -S --needed - < rice-packages.txt

# 2. Instalar yay (se necessário) e pacotes do AUR
echo "Instalando pacotes do AUR..."
if ! command -v yay &> /dev/null; then
  echo "yay não encontrado. Instalando yay..."
  git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd ..
fi
yay -S --needed --noconfirm - < rice-aur-packages.txt

# 3. Restaurar configurações
echo "Copiando configurações..."
cp -rf .config ~/
cp -rf .themes ~/
cp -rf .local ~/
cp -rf Wallpapers ~/Imagens/ 2>/dev/null || mkdir -p ~/Imagens && cp -rf Wallpapers ~/Imagens/
cp .bashrc ~/ 2>/dev/null || true
cp .gtkrc-2.0 ~/ 2>/dev/null || true

# 4. Pós-instalação
echo "Atualizando cache de fontes e diretórios..."
fc-cache -rv
xdg-user-dirs-update

echo "Rice restaurado com sucesso."

