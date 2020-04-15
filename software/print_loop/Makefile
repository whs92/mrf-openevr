#/media/adam/DATA/opt/Xilinx/petalinux/tools/linux-i386/gcc-arm-linux-gnueabi/bin/arm-linux-gnueabihf-gcc -g descriptors.c registers.c main.c 
# sudo apt-get install gcc-arm-linux-gnueabihf maybe?
all : upload

mem.out: 
	/media/adam/DATA/opt/Xilinx/petalinux/tools/linux-i386/gcc-arm-linux-gnueabi/bin/arm-linux-gnueabihf-gcc -g descriptors.c registers.c main.c -o print_loop

upload: mem.out
	scp print_loop pico:~/
