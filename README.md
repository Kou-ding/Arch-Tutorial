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

### Pacman Cheatsheet 
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
```

### Installing yay
AUR (Arch User Repository) expands the official arch repository. To access AUR we need a helper such as yay. 
Installing it is as easy as typing:
```bash 
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

Basic commands:
```bash
# Install applications from the AUR
yay -S pipes.sh # -S: syncronize and install

# Updates the packages from the official repositories as well as the AUR repositories
yay -Syu

# and others... The flags are the same as pacman's. Refer to the above pacman cheatsheet.
```

### Auto mounting drives at startup
```bash
# Find your drive's UUID, type and label
sudo blkid

# Make a directory to mount the drive to
sudo mkdir -p /media
sudo mkdir -p /media/drive_label

# Make the drive entry inside the fstab file which mounts the system's partitions at startup 
nvim /etc/fstab

# Add this line at the bottom of the fstab file
UUID=your-uuid-here  /media/drive_label your-drive-type-here  defaults,uid=yourusername,gid=yourusername,umask=0022  0  2
```
Parameter explanation
- defaults: Includes the standard mount options (rw, suid, dev, exec, auto, nouser, async).
- uid=yourusername: Sets the user ID for the mounted drive to your username, giving you ownership.
- gid=yourusername: Sets the group ID for the mounted drive to your username's group.
- umask=0022: Sets permissions on the files and directories within. 0022 gives rwxr-xr-x permissions, allowing you to have full access and others to have read access.

Setting the permissions this way negates the problem of having to enter your password every time you want to make changes to the drive.
This includes simple stuff as moving, copying, deleting files and creating new folders.

