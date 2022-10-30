# KVM-LenovoLegion5

A guide for a successful GPU passthrough on the Lenovo Legion 5 (intel version). Please take this as a template and modify it to your needs.

### Sources:

- [Arch wiki](https://wiki.archlinux.org/title/KVM)
- [SOG Virtual machine video](https://youtu.be/BUSrdUoedTo)
- The amazing people on [/r/VFIO/](https://www.reddit.com/r/VFIO/)

### Specs:

- Distro: Arch Linux running non-lts kernel
- CPU: i5-10300H
- GPU: Nvidia 1650 (4GB)
- RAM: 16GB DDR4 3200mhz

---

### Step 0

For the most part I followed the [SOG Virtual machine video](https://youtu.be/BUSrdUoedTo) but changed some stuff to make things actually work (mostly the configuration files)

### Step 0.1

By the end your hooks folder should look something like this:

![hooks directory](https://i.imgur.com/TsJs4ps.png)

So if you followed the SOG virtual machine video yours should also looks like this(at least the file structure should) now we're going to have to make some modifications to the start.sh and stop.sh scripts to make it actually work properly. Because since the video was uploaded some stuff have changed.

Here you can see the fixed start and stop scripts. Please make the appropriate changes.

### Start.sh

Find it [here](https://github.com/mraif13/KVM-LenovoLegion5/blob/master/start.sh)

### revert.sh -- Previously stop.sh

Find it [here](https://github.com/mraif13/KVM-LenovoLegion5/blob/master/stop.sh)

---

### Getting things to work properly

Do this in order: Laptop Keyboard: `Virt manager > + Add Hardware > USB Host Device > Integrated Technology Express, Inc ITE Device(8910)`
