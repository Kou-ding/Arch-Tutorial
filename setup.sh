#!/bin/bash

# Update package list
sudo pacman -Syu

# List of Arch packages
declare -A packages=(
    # Applications
    ["firefox"]="Web browser"
    ["obsidian"]="Note-taking app"
    ["steam"]="Gaming platform"
    ["discord"]="Chat for gamers and communities"
    ["gimp"]="Image editor"
    ["vlc"]="Media player"
    ["libreoffice-fresh"]="Office suite"
    ["qbittorrent"]="BitTorrent client"
    ["filezilla"]="FTP client"

    # KDE staff
    ["kmail"]="Email client"
    ["kdenlive"]="Video editor"
    ["kde-partition-manager"]="Disk partitioning tool"
    ["filelight"]="Disk usage analyzer"

    # System utilities
    ["btop"]="Resource monitor"
    ["htop"]="Interactive process viewer"
    ["fastfetch"]="System information tool"
    ["os-prober"]="Detect other operating systems"
    ["flatpak"]="App distribution and package management"
)

# List of AUR packages
declare -A aurpackages=(
    ["visual-studio-code-bin"]="Code editor"
    ["stremio"]="Video streaming app"
    ["cpu-x"]="System information tool"
    ["zoom"]="Video conferencing"
    ["signal-desktop"]="Encrypted messaging"
    ["chromium-snapshot-bin"]="Web browser"
    ["localsend"]="File sharing"
    ["heroic-games-launcher-bin"]="Game launcher"
)

# Install each package and display the comment
for app in "${!packages[@]}"; do
    if pacman -Q $app &> /dev/null; then
        echo "$app is already installed, skipping."
    else
        echo "Installing $app - ${packages[$app]}"
        sudo pacman -S --noconfirm $app
    fi
done

# Install AUR applications
for app in "${!aurpackages[@]}"; do
    if yay -Q $app &> /dev/null; then
        echo "$app is already installed, skipping."
    else 
        echo "Installing $app - ${aurpackages[$app]}"
        yay -S --noconfirm $app
    fi
done

echo "All packages installed successfully."

# Flatpak











