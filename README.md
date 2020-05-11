# mrf-openevr
Open source Event Receiver implementation based on the [open EVR by MRF](https://github.com/jpietari/mrf-openevr)

## Prerequisites

### Hardware

Avnet PicoZed 7Z030 Module P/N AES-Z7PZ-7Z030-SOM-G
Avnet PicoZed FMC Carrier Card V2 P/N AES-PZCC-FMC-V2-G

### Software Tools

Xilinx Vivado 2017.4 (Free WebPack version is sufficient to build to project)

You'll need to install the custom board files by merging the "board_files" repo folder to `...\Xilinx\Vivado\2017.4\data\boards` - must be done before sourcing

Reference clock programming on FMC carrier

http://picozed.org/support/design/13076/106

# Building the example design

`git clone <repo>` 

`vivado -mode tcl`

`%vivado source ./openevr.tcl`

or open Vivado and in the console:
-	`cd` to the repo directory 
-	`source ./openevr.tcl`

A new folder called "openevr" will be created containing the porject files.
Should build but there have been known issues of rebuilding projects from TCL scripts. If you have problems, use the archive in the releases


# SD card

You'll need to write the iso image to an 8gb SD card or make up your own according to to the wiki and the files in the "petalinux" folder.

# Bitstream

Note that the default bitstream on the SD card built into the image.ub is an old version and not the v0.2. You can boot up fine with it but you should reprogram the FPGA with the Hardware Manager after boot using the SmartLynq or JTAG programmer. This is how i've been doing development - just reprogramming the FPGA live (unless we need to change device tree options...)

# Repo Folder Breakdown

* `board_files` contains the custom board definitions for em.avnet.com:picozed_7030_fmc2:part0:1.1
* `build` contains generated bitstreams
* `petalinux` contains the device tree required for the project along with the Linux userspace files and SD image
* `ip` contains the ip blocks used in the design (both custom and Vivado generated .xci)
* `software` contains the C source to set up the hardware and pull events + decoded timestamps via interrupt driven mechanism
* `vhdl` contains source files, simulation files and constraints
