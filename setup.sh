#!/bin/bash

# Update package list
sudo pacman -Syu

# List of Arch packages
declare -A packages=(
    # Applications
    ["firefox"]="Web browser"
    ["obsidian"]="Note-taking app"
    ["steam-native-runtime"]="Gaming platform"
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
    ["nano-syntax-highlighting"]="Syntax highlighting for nano"
    ["pacman-contrib"]="Useful pacman utils like rankmirrors"

    # Neovim
    ["neovim"]="Modern text editor"
    ["kitty"]="Lazyvim compatible terminal emulator"
    ["luarocks"]="Lua package manager"
    ["imagemagick"]="Image processing library"
    ["lazygit"]="Terminal-based Git client"
    ["fd"]="Simple file finder"
    ["fzf"]="Command-line fuzzy finder"
    ["ast-grep"]="Advanced syntax-aware grep"
    ["lua51"]="Lua 5.1 interpreter"
    ["wl-clipboard"]="Wayland clipboard management"
    ["tree-sitter-cli"]="Syntax tree parsing tool"
    ["ruby"]="Ruby programming language"
    ["php"]="PHP programming language"
    ["npm"]="Node.js package manager"
    ["mermaid-cli"]="mmdc tool for generating diagrams"
    ["fish"]="User-friendly shell"

    
    # Latex
    ["texlive-latex"]="Foundemental Latex installation"
    ["texlive-latexextra"]="Additional Latex packages"
    ["texlive-latexrecommended"]="Recommended Latex packages"
    ["texlive-fontsrecommended"]="Recommended fonts for Latex"
    ["texlive-xetex"]="XeLatex support"
    ["texlive-binextra"]="Includes latexmk"
    ["texlive-langgreek"]="Greek language support"
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
    ["miniconda3"]="Python package, dependency and environment management"
    ["orchis-theme-git"]="GTK theme"
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











