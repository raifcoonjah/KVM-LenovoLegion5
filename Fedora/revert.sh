#!/bin/bash

## Load the config file
source "/etc/libvirt/hooks/kvm.conf"

# Used for Debugging, Do NOT Remove.
set -x

# Completely unbind GPU from Host
virsh nodedev-reattach $VIRSH_GPU_VIDEO
virsh nodedev-reattach $VIRSH_GPU_AUDIO

# unload vfio module
# I went overboard with this, remove as per your specifications. 
modprobe -r vfio-pci
modprobe -r vfio_iommu_type1
modprobe -r vfio

# Load NVIDIA kernel modules
modprobe nvidia_drm
modprobe nvidia_modeset
modprobe nvidia_uvm
modprobe nvidia

# Sleep 2 seconds before rebinding framebuffer
sleep 2

# Rebind framebuffer to host
echo "efi-framebuffer.0" > /sys/bus/platform/drivers/efi-framebuffer/bind

# Bind VTconsoles: might not be needed
echo 1 > /sys/class/vtconsole/vtcon0/bind
echo 1 > /sys/class/vtconsole/vtcon1/bind

# Waiting 1 second 
sleep 1

#systemctl start display-manager.service -- Disabled due to recent Kernel 5.19 bug.

# Reboot host machine
reboot