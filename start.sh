# Used for Debugging, Do NOT Remove. 
set -x

# Stopping display manager used by KDE (in this case SDDM)
systemctl stop display-manager

# Unbind VTconsoles
echo 0 > /sys/class/vtconsole/vtcon0/bind
echo 0 > /sys/class/vtconsole/vtcon1/bind

# Unbind EFI-framebuffer
echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind

# Avoid race condition. Let's wait 10 seconds before unloading NKM (nvidia kernel modules)
sleep 10

# Unload NVIDIA kernel modules
modprobe -r nvidia_drm 
modprobe -r nvidia_modeset 
modprobe -r nvidia_uvm 
modprobe -r nvidia


# Completely unbind GPU from Host
virsh nodedev-detach pci_0000_01_00_0
virsh nodedev-detach pci_0000_01_00_1

# Load vfio
modprobe vfio_pci
