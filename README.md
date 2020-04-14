# mrf-openevr
Open source Event Receiver implementation

Prerequisites

Hardware

Avnet PicoZed 7Z030 Module P/N AES-Z7PZ-7Z030-SOM-G
Avnet PicoZed FMC Carrier Card V2 P/N AES-PZCC-FMC-V2-G

Software Tools

Xilinx Vivado 2017.4 (Free WebPack version is sufficient to build to project)

Reference clock programming on FMC carrier

http://picozed.org/support/design/13076/106

Building the example design

git clone 
vivado -mode tcl
%vivado source ./openevr.tcl

or open Vivado and in the console:
	cd to the directory 
	"source ./openevr.tcl"

Should build but there have been known issues of rebuilding projects from TCL scripts. If you have problems, use the archive in the releases