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
  + KR260      : Kria KR260 Robotics  Startar Kit.
* Boot Loader
  + FSBL(First Stage Boot Loader for ZynqMP)
  + PMU Firmware(Platform Management Unit Firmware)
  + BL31(ARM Trusted Firmware Boot Loader stage 3-1)
  + U-Boot xilinx-v2019.2 (customized)
* [Linux Kernel Version 6.1.42-zynqmp-fpga-trial](https://github.com/ikwzm/ZynqMP-FPGA-Linux-Kernel-6.1/tree/6.1.42-zynqmp-fpga-trial-1)
  + [linux-stable 6.1.42](https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git//tag/?h=v6.1.42)
  + Patched equivalent to linux-xlnx v2022.2
  + Enable Device Tree Overlay with Configuration File System
  + Enable FPGA Manager
  + Enable FPGA Bridge
  + Enable FPGA Reagion
  + Enable ATWILC3000 Linux Driver for Ultra96-V2
  + Enable Lima(Open Source Mali-400 Device Driver)
    - Patch to lima for multiple clocks
    - Patch to lima for multiple interrupt names
    - Patch to lima for alternative device tree ID
    - Patch to xlnx_drm for default alignment size
    - Patch to xlnx_drm for enable data cache
  + Other config -> [files/config-6.1.42-zynqmp-fpga-trial-1](files/config-6.1.42-zynqmp-fpga-trial-1)
* Ubuntu22.04.2(jammy) Console(CUI Only) Root File System
  + Installed build-essential
  + Installed ruby python python3
  + Installed Other package list -> [files/ubuntu22.04-console-dpkg-list.txt](files/ubuntu22.04-console-dpkg-list.txt)

Release
------------------------------------------------------------------------------------

| Release  | Released  | Ubuntu Version | Linux Kernel Version           | Release Tag |
|:---------|:----------|:---------------|:-------------------------------|:------------|
| v1.2.0   | 2023-7-31 | Ubuntu 22.04.2 | 6.1.42-zynqmp-fpga-trial-1     | [v1.2.0](https://github.com/ikwzm/ZynqMP-FPGA-Ubuntu22.04-Console/tree/v1.2.0)
| v1.1.2   | 2023-5-10 | Ubuntu 22.04.2 | 5.15.108-zynqmp-fpga-trial-2   | [v1.1.2](https://github.com/ikwzm/ZynqMP-FPGA-Ubuntu22.04-Console/tree/v1.1.2)
| v1.0.0   | 2022-9-30 | Ubuntu 22.04.1 | 5.10.120-zynqmp-fpga-trial-16  | [v1.0.0](https://github.com/ikwzm/ZynqMP-FPGA-Ubuntu22.04-Console/tree/v1.0.0)

Install
------------------------------------------------------------------------------------

### Install to SD-Card

* [Ultra96](doc/install/ultra96-console.md)
* [Ultra96-V2](doc/install/ultra96v2-console.md)
* [KV260](doc/install/kv260-console.md)
* [KR260](doc/install/kr260-console.md)

### Setup Ultra96/Ultra96-V2/KV260 borad

* Put the SD-Card in the slot on Ultra96/Ultra96-V2/KV260/KR260.

#### Ultra96/Ultra96-V2

* Plug in a UART to PS UART1 ports of the Ultra96/Ultra96-V2.

#### KV260/KR260

* Plug in a UART-USB Adapter to Micro USB UART/JTAG ports of the KV260/KR260.

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
  + [Ultra96](doc/build/boot-ultra96.md)
  + [Ultra96-V2](doc/build/boot-ultra96v2.md)
* [Build Linux Kernel 6.1.42-zynqmp-fpga-trial](doc/build/linux-6.1.42-zynqmp-fpga-trial.md)
* [Build Ubuntu 22.04 Console RootFS](doc/build/ubuntu22.04-console.md)
