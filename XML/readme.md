### Here I'll explain some of tweaks I made to make everything work

---

`<qemu:commandline> <qemu:arg value="-acpitable"/> <qemu:arg value="file=/home/raif/KVM/SSDT1.dat"/> </qemu:commandline>`

Used to fake battery inside of the VM so that the Nvidia drivers can work properly.
If you don't add this you'll likely experience the well known Code 43 error.

Learn more inside of the [ArchWiki](<https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF#%22Error_43:_Driver_failed_to_load%22_with_mobile_(Optimus/max-q)_nvidia_GPUs>)

---

`<qemu:capabilities> <qemu:del capability="usb-host.hostdevice"/> </qemu:capabilities>`

For audio/microphone inside of VM I'm my galaxy buds using the integrated bluetooth card `001:006 Intel Corp. AX201 Bluetooth`, this lines of code fix an error that prevents the drivers from loading properly.

---

`<vendor_id state="on" value="randomid"/>`

Needed to make Nvidia drivers load inside of the VM.
