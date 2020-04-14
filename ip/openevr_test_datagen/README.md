# Operation
The counter mode causes data out to be incremented per clk cycle up to the Count amount specified in Reg 2. Note that this is blocking and won't stop

The single bit mode causes data out to push the Count amount/single set amount out once. It needs to be retriggered by toggling the single bit mode

Reset resets the status register

Status register holds how many values we've pushed out

# Memory Map

Base Addr: `0x43C00000`

### V2.2

| Reg 					| Bit 		| Description 					|
| ------ 					| - 			| -							|
| Reg 1 0x0 : Ctrl (RW)   		| 0 			| Enable `test_data_gen` module 	|
|						|1			| Enable counter mode				|
|						|2			|Enable single bit mode				|
|						|3			|Reset						|
|Reg 2 0x4: Count Ctrl (RW)	| 31 downto 0	| Count amount/single set amount|
|Reg 3: 0x8: Status (R)		|31 downto 0	|	Amount counted	|


# Test routine

```
#### Testing single write mode
# set our single value
mwr -force 0x43C00004 0xDEADBEEF
# enable single value mode
mwr -force 0x43C00000 0x5

# check status register, should be 1
mrd -force 0x43C00008


#### Testing counter mode
# Set out count to 255
mwr -force 0x43C00004 0xff
# Enable counter
mwr -force 0x43C00000 0x3

# Quickly disable counter 
mwr -force 0x43C00000 0x0
# Check our status reg
mrd -force 0x43C00008



# Data to the default ram address can be read via:
mrd -force 0x20000000 10

```