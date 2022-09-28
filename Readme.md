ZynqMP-FPGA-Ubuntu22.04-Console
====================================================================================

Overview
------------------------------------------------------------------------------------

### Introduction

This Repository provides a Ubuntu22.04-Console(CUI Only) for Zynq MPSoC.

### Note

**The Linux Kernel Image and Ubuntu22.04 RootFS provided in this repository is not official.**

**I modified it to my liking. Please handle with care.**

### Features

* Hardware
  + Ultra96    : Xilinx Zynq UltraScale+ MPSoC development board based on the Linaro 96Boards specification. 
  + Ultra96-V2 : updates and refreshes the Ultra96 product that was released in 2018.
  + KV260      : Kria KV260 Vision AI Startar Kit.
* Boot Loader
  + FSBL(First Stage Boot Loader for ZynqMP)
  + PMU Firmware(Platform Management Unit Firmware)
  + BL31(ARM Trusted Firmware Boot Loader stage 3-1)
  + U-Boot xilinx-v2019.2 (customized)
* Linux Kernel Version 5.10.120-zynqmp-fpga-trial
  + [linux-stable 5.10.120](https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git//tag/?h=v5.10.120)
  + Patched equivalent to linux-xlnx v2021.2
  + Enable Device Tree Overlay with Configuration File System
  + Enable FPGA Manager
  + Enable FPGA Bridge
  + Enable FPGA Reagion
  + Enable ATWILC3000 Linux Driver for Ultra96-V2
* Ubuntu22.04(jammy) Console(CUI Only) Root File System
  + Installed build-essential
  + Installed ruby python python3
  + Installed Other package list -> [files/ubuntu22.04-console-dpkg-list.txt](files/ubuntu22.04-console-dpkg-list.txt)

Install
------------------------------------------------------------------------------------

### Install to SD-Card

* [Ultra96](doc/install/ultra96-console.md)
* [Ultra96-V2](doc/install/ultra96v2-console.md)
* [KV260](doc/install/kv260-console.md)

### Setup Ultra96/Ultra96-V2/KV260 borad

* Put the SD-Card in the slot on Ultra96/Ultra96-V2/Kv260.

#### Ultra96/Ultra96-V2

* Plug in a UART to PS UART1 ports of the Ultra96/Ultra96-V2.

#### KV260

* Plug in a UART-USB Adapter to Micro USB UART/JTAG ports of the KV260.

### Starting Ultra96/Ultra96-V2/KV260 board

* Turn on the Ultra96/Ultra96-V2/KV260.
* After a few seconds, the Ubuntu login propmpt will appear on the system console.
* Your username is "fpga". Password is set to "fpga". Please login.
* The username and password for administrator rights is "admin".

FAQ
------------------------------------------------------------------------------------

* [Change system console](doc/faq/change_system_console.md)
* [Setup WiFi](doc/faq/setup_wifi.md)

Build 
------------------------------------------------------------------------------------

* Build Boot Loader
  + [Ultra96](doc/build/ultra96-boot.md)
  + [Ultra96-V2](doc/build/ultra96v2-boot.md)
* [Build Linux Kernel 5.10.120-zynqmp-fpga-trial](doc/build/linux-5.10.120-zynqmp-fpga-trial.md)
* [Build Ubuntu 22.04 Console RootFS](doc/build/ubuntu22.04-console.md)
