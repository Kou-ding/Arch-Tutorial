#!/bin/bash

# Update package list
sudo pacman -Syu

# List of Arch packages
declare -A packages=(
    ["flatpak"]="Sandbox applications"
    ["os-prober"]="Detect other operating systems"
    ["firefox"]="Web browser"
    ["thunderbird"]="Email client"
    ["obsidian"]="Note-taking app"
    ["steam"]="Gaming platform"
    ["discord"]="Chat for gamers and communities"
    ["gimp"]="Image editor"
    ["vlc"]="Media player"
    ["libreoffice-fresh"]="Office suite"
    ["qbittorrent"]="BitTorrent client"
    ["filezilla"]="FTP client"
    ["neovim"]="Text editor"
    ["figlet"]="Text-to-ASCII banner"
    ["btop"]="Resource monitor"
    ["htop"]="Interactive process viewer"
    ["neofetch"]="System information tool"
    ["cmatrix"]="Matrix-like terminal display"
    ["papirus-icon-theme"]="Papirus icon theme"
    ["ttf-jetbrains-mono-nerd"]="JetBrains Mono font"
)

# List of AUR packages
declare -A aurpackages=(
    ["visual-studio-code-bin"]="Code editor"
    ["stremio"]="Video streaming app"
    ["cpu-x"]="System information tool"
    ["pipes.sh"]="Animated pipes terminal screensaver"
    ["orchis-kde-theme"]="GTK and icon theme"
    ["cava"]="Audio visualizer for the terminal"
    ["cbonsai"]="Cute bonsai tree generator"
)

# Install each package and display the comment
for app in "${!packages[@]}"; do
    echo "Installing $app - ${packages[$app]}"
    sudo pacman -S --noconfirm $app
done

# Install AUR applications
for app in "${!aurpackages[@]}"; do
    echo "Installing $app - ${aurpackages[$app]}"
    yay -S --noconfirm $app
done

echo "All packages installed successfully."







