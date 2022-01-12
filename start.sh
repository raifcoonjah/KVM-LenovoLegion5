# debugging
set -x

# stop display manager (sddm)
systemctl stop display-manager

# unbind VTconsoles
echo 0 > /sys/class/vtconsole/vtcon0/bind
echo 0 > /sys/class/vtconsole/vtcon1/bind

# Unbind EFI-framebuffer
echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind

# avoid race condition
sleep 10

# Unload NVIDIA kernel modules
modprobe -r nvidia_drm 
modprobe -r nvidia_modeset 
modprobe -r nvidia_uvm 
modprobe -r nvidia

# unbind gpu completely
virsh nodedev-detach pci_0000_01_00_0
virsh nodedev-detach pci_0000_01_00_1

# load vfio
modprobe vfio_pci
