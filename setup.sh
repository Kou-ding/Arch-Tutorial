#!/bin/bash

# Update package list
sudo pacman -Syu

# List of Arch packages
declare -A packages=(
    ["flatpak"]="App distribution and package management"
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
    ["cava"]="Audio visualizer for the terminal"
    ["cbonsai"]="Cute bonsai tree generator"
    ["orchis-kde-theme"]="GTK and icon theme"
    ["davinci-resolve"]="Video editor"
    ["zoom"]="Video conferencing"
    ["signal-desktop"]="Encrypted messaging"
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












