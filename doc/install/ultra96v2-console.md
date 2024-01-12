## Install Ubuntu 22.04.3 LTS(Console) to Ultra96-V2

### Downlowd from github

**Note: Downloading the entire repository is time consuming, so download only the branch you need.**

```console
shell$ wget https://github.com/ikwzm/ZynqMP-FPGA-Ubuntu22.04-Console/archive/refs/tags/v3.0.0.tar.gz
shell$ tar xfz v3.0.0.tar.gz
shell$ cd ZynqMP-FPGA-Ubuntu22.04-Console-3.0.0
```

### File Description

 * target/Ultra96-V2/
   + boot/
     - boot.bin                                                    : Stage 1 Boot Loader
     - uEnv.txt                                                    : U-Boot environment variables for linux boot
     - devicetree-6.1.70-zynqmp-fpga-trial-ultra96v2.dtb           : Linux Device Tree Blob   
     - devicetree-6.1.70-zynqmp-fpga-trial-ultra96v2.dts           : Linux Device Tree Source
 * files/
   + vmlinuz-6.1.70-zynqmp-fpga-trial-2                            : Linux Kernel Image
 * ubuntu22.04-console-rootfs.tgz.files/                           : Ubuntu 22.04.3 LTS Console Root File System
   + x00 .. x09                                                    : (splited files)
 
### Format SD-Card

[./doc/install/format-disk.md](format-disk.md)

### Write to SD-Card

#### Mount SD-Card

```console
shell# mount /dev/sdc1 /mnt/usb1
shell# mount /dev/sdc2 /mnt/usb2
```
#### Make Boot Partition

```console
shell# cp target/Ultra96-V2/boot/* /mnt/usb1
shell# gzip -d -c files/vmlinuz-6.1.70-zynqmp-fpga-trial-2 > /mnt/usb1/image-6.1.70-zynqmp-fpga-trial
```

#### Make RootFS Partition

```console
shell# (cat ubuntu22.04-console-rootfs.tgz.files/*) | tar xfz - -C /mnt/usb2
```

#### Add boot partition mount position to /etc/fstab

```console
shell# mkdir /mnt/usb2/mnt/boot
shell# cat <<EOT >> /mnt/usb2/etc/fstab
/dev/mmcblk0p1	/mnt/boot	auto	defaults	0	0
EOT
```

#### Setup WiFi

The Ultra96/Ultra96-V2 connects to your network through WiFi.
It may be better to create a configuration file on the host side in advance and write it to RootFS.
Of cause, you can boot Ultra96/Ultra96-V2 later and configure it there.

  * ssid: ssssssss
  * passphrase: ppppppppp

```console
shell# cat <<EOT > /mnt/usb2/etc/netplan/99-network-config.yaml
network:
  version: 2
  renderer: NetworkManager
  wifis:
    wlan0:
      optional: true
      access-points:
        "ssssssss" :
            password: "ppppppppp"
      dhcp4: true
EOT
```

#### Change system console

If you want to change the system console, change the "linux_boot_args_console" variable in "/mnt/usb1/uEnv.txt".

##### Change to serial port

```text:/mnt/usb1/uEnv.txt

linux_boot_args_console=console=ttyPS0,115200

```

##### Change to Motitnor+Keyboard

```text:/mnt/usb1/uEnv.txt

linux_boot_args_console=console=tty1

```

#### Unmount SD-Card

```console
shell# umount /mnt/usb1
shell# umount /mnt/usb2
```
