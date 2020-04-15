# Functionality

This program sets up the initialises hardware registers and interrupts to push the 32bit data from the "mrf_event_din"/"fifo_din" data path.

Current V0.2 arrangement has three 32 bit words sent per event with structure:
 - Word 1: seconds decoded
 - Word 2: timestamp decoded
 - Word 3: event code

# Usage

All register configurations are set up in the background. The configurable parameters are:
- threshold - Set the limit of 32bit words in the fifo which will cause an interrupt to fire
- descriptors - Sets how many descriptors to set up per transaction (you want slightly under rather than too many else you won't have enough data to push the transaction)

# Running
* `./print_loop -t 20 -d 10` threshold 20, 10 descriptors
* we deal in 32bit words each
* check`/proc/interrupts` if neccessary

# Expected output

Should look similar to:
```
root@software:~# ./print_loop -t 20 -d 10
Settings threshold to 20, n_des set to 10
Completed init
Loop 0
Waiting for threshold rd interrupt
Tail is 0x40000240
Waiting on DMA desc intr
0x5e188f16
0x019ee4ac
0x0000000b
...

```

Where 0x5e188f16 is seconds decoded, 0x019ee4ac is timestamp decoded and 0x0000000b is event code