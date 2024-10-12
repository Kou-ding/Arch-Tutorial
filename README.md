# Arch-Tutorial
A very detailed tutorial on how to install arch linux.

# Easy installation
When you are booted into the usb stick type:
```bash
archinstall
```
This will provide a command line based installer that is very easy to use.

### Repositories
To include or exclude any repositories you need to uncomment or comment the related lines
inside the pacman configuration file.
```bash
# pacman configuration file location 
sudo nvim /etc/pacman.conf
```
For example for multilib you have to uncomment these two lines. 
```bash
#[multilib]
#Include = /etc/pacman.d/mirrorlist
```
Finally perform an upgrade:
```bash
sudo pacman -Syu
```

### Mirrors List
If a package doesn't exist when trying to download it, it could be a mirror issue. The fix is to update the 
mirrors list adding new ways of acquiring that package.
```bash
# edit the mirrorlist file
sudo nvim /etc/pacman.d/mirrorlist
# do a system update to utilize the new mirrors
sudo pacman -Syu
```

### Packages
```bash
# Updates the packages installed form the official arch repositories
sudo pacman -Syu # -Sy: syncronize, -u: upgrade

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

### Installing yay
To access AUR we need a helper such as yay. Installing it is easy just type:
```bash 
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

### Auto mounting drives at startup
```bash
# Make a directory to mount the drive to
sudo mkdir -p /media
sudo mkdir -p /media/drive_label

# Find your drive's UUID
blkid

# Make the drive entry inside the fstab file which mounts the system's partitions at startup 
nvim /etc/fstab

# Add this line at the bottom of the fstab file
UUID=UUID_string  /media/drive_label  defaults  0  0
# the parameters are separated by a single tab
```
