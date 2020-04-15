# mrf-openevr
Open source Event Receiver implementation

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

# Repo Folder Breakdown

* `board_files` contains the custom board definitions for em.avnet.com:picozed_7030_fmc2:part0:1.1
* `build` contains generated bitstreams
* `ip` contains the ip blocks used in the design (both custom and Vivado generated .xci)
* `vhdl` contains source files, simulation files and constraints
