# Arch-Tutorial
A very detailed tutorial on how to install arch linux.


### Packages
```bash
# Updates the packages installed form the official arch repositories
sudo pacman -Syu # -Sy: syncronize, -u: upgrade
# Install basic applications
sudo pacman -S discord thunderbird neovim bc ttf-jetbrains-mono-nerd figlet btop htop obsidian gimp vscode wl-clipboard

# Useful commands
sudo pacman -R package_name # -R: Remove
sudo pacman -Rs package_name # -Rs: Remove sweep, remove a package and its dependencies
sudo pacman -Ss package_name # -Ss: Sync search, search for a package in the repositories
sudo pacman -Si package_name # -Si: Show info, display inforamtion about a package
sudo pacman -Q # -Q: Query, lists all the packages installed in the system
sudo pacman -Q package_name # -Q: Query, checks if a program is installed in the system
sudo pacman -Sc # -Sc: Sync clean, clears the old package cache keeping only the recent versions
sudo pacman -Scc # -Scc: Sync clean clean, clears the entire package cache
sudo pacman -Rns # -Rns: Remove nodependencies sweep, removes dependencies that are not used by any program


# Install applications from the AUR(Arch User Repository)
# It expands the official repository but the packages aren't guaranteed to work
yay -S pipes.sh # -S: syncronize and install
# Updates the packages from the official repositories as well as the AUR repositories
yay -Syu
```
