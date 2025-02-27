# WIFI

### Network
```bash
# Network adapter: Asus USB-AC58 
yay -S rtl88x2bu-dkms-git 
# Load kernel module
sudo modprobe 88x2bu
# After an update, if wifi stops working, rebuild and install the module
sudo dkms autoinstall # dkms: dynamic kernel module support
```
