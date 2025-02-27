# Packages

### Repositories
To include or exclude any repositories you need to uncomment or comment the related lines
inside the pacman configuration file.
```bash
# pacman configuration file location 
sudo nano /etc/pacman.conf
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
sudo nano /etc/pacman.d/mirrorlist
# do a system update to utilize the new mirrors
sudo pacman -Syu
```