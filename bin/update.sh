#!/bin/bash
set -e

function npm_update {
	for package in $(npm -g outdated --parseable --depth=0 | cut -d: -f3)
	do
    		echo "Actualizando: $package"
		npm -g install "$package"
	done
}

echo 'Actualizando el sistema'
sudo apt update
sudo apt upgrade -y
echo 'Actualizando npm'
npm_update
echo 'Actualizando snap'
sudo snap refresh
echo 'Actualizando flatpak'
flatpak update
echo 'Actualizando rust ⚙'
rustup update
cargo install-update -a
