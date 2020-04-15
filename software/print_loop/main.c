#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <memory.h>
#include "registers.h"
#include "descriptors.h"

#define ADDRESS_DESCRIPTOR_BRAM 0x40000000
#define ADDRESS_DMA 0x40400000
#define ADDRESS_DATA_GENERATOR 0x43C00000
#define ADDRESS_STREAM_MANAGER 0x43C10000
#define ADDRESS_FIFO_RESET 0x41210000 //prolly intergrate this into the ip


#define ADDRESS_HPO_RAM 0x20000000

#define BYTES_PER_DESCRIPTOR 0x4
#define NO_OF_DESCRIPTORS 4

int main(int argc, char *argv[]) {
	__uint32_t threshold = 10;
	__uint32_t n_descriptors = 4;
	int opt;

        while ((opt = getopt(argc, argv, "t:d:")) != -1) {
               switch (opt) {
		case 't' :
                   threshold = atoi(optarg);
                   break;
		case 'd' :
                   n_descriptors = atoi(optarg);
                   break;
               default: /* '?' */
                   fprintf(stderr, "Usage: %s [-t threshold] [-d] n_descriptors\n",
                           argv[0]);
                   exit(EXIT_FAILURE);
               }
           }
	printf("Settings threshold to %d, n_des set to %d\n", threshold, n_descriptors);

	int memfd = open("/dev/mem", O_RDWR | O_SYNC);
	void *MMAP_DESCRIPTOR_BRAM, *MMAP_DMA, *MMAP_DATA_GENERATOR, *MMAP_STREAM_MANAGER, *MMAP_RAM, *MMAP_FIFO_RESET;

	MMAP_DESCRIPTOR_BRAM = mmap(0, 4096UL, PROT_READ | PROT_WRITE, MAP_SHARED, memfd, ADDRESS_DESCRIPTOR_BRAM);
	MMAP_DMA = mmap(0, 4096UL, PROT_READ | PROT_WRITE, MAP_SHARED, memfd, ADDRESS_DMA);
	MMAP_DATA_GENERATOR = mmap(0, 4096UL, PROT_READ | PROT_WRITE, MAP_SHARED, memfd, ADDRESS_DATA_GENERATOR);
	MMAP_STREAM_MANAGER = mmap(0, 4096UL, PROT_READ | PROT_WRITE, MAP_SHARED, memfd, ADDRESS_STREAM_MANAGER);
	MMAP_RAM = mmap(0, 4096UL, PROT_READ | PROT_WRITE, MAP_SHARED, memfd, ADDRESS_HPO_RAM);
	MMAP_FIFO_RESET = mmap(0, 4096UL, PROT_READ | PROT_WRITE, MAP_SHARED, memfd, ADDRESS_FIFO_RESET);

	__uint32_t tailLSB =  generateDescriptors(MMAP_DESCRIPTOR_BRAM, ADDRESS_DESCRIPTOR_BRAM, ADDRESS_HPO_RAM, BYTES_PER_DESCRIPTOR, n_descriptors); //write descriptors

	//init
	virtual_set(MMAP_FIFO_RESET, 0x8, (0x1)); //reset fifo
	virtual_set(MMAP_FIFO_RESET, 0x8, (0x0)); //restore state
	virtual_set(MMAP_STREAM_MANAGER, 0x4, (0x2 )); //reset the stream manager
	virtual_set(MMAP_STREAM_MANAGER, 0x4, (0x0 )); //restore state
	virtual_set(MMAP_DATA_GENERATOR, 0x0, (0x1 | 0x8  )); //reset block | 0x10 to enable
	virtual_set(MMAP_DATA_GENERATOR, 0x0, (0x1  )); //restore state | 0x10 to enable
	virtual_set(MMAP_STREAM_MANAGER, 0x0, (n_descriptors )); //set packet_size to 4 32bit values

	virtual_set(MMAP_STREAM_MANAGER, 0x0C, threshold); 

	int fd_uio = open("/dev/uio0", O_RDWR); 
	int fd_uio_stream = open("/dev/uio1", O_RDWR); // uio1 for stream_manager
	__uint32_t reenable = 1;
	__uint32_t pending = 0;

	if ((fd_uio < 0) || (fd_uio_stream < 0))
	{
		perror("Error opening uio fd");
		exit(1);
	}
	int gpio_size;
	int fp_size = fopen("/sys/class/uio/uio0/maps/map0/size", "r");
	fscanf(fp_size, "0x%08X", &gpio_size);
	void * ptr_uio = mmap(NULL, gpio_size, PROT_READ|PROT_WRITE, MAP_SHARED, fd_uio, 0);
	__uint32_t statusreg;

	printf("Completed init\n");

	for (int i =0; i< 10; i++)
	{
		printf("Loop %d\n", i);

		if (write(fd_uio, (void *)&reenable, sizeof(int)) < 0)
		{
			fprintf(stderr, "Cannot enable UIO interrupt errno %s\n", strerror(errno));
			exit(errno);
		}

		if (write(fd_uio_stream, (void *)&reenable, sizeof(int)) < 0)
		{
			fprintf(stderr, "Cannot enable fd_uio_stream interrupt errno %s\n", strerror(errno));
			exit(errno);
		}

		printf("Waiting for threshold rd interrupt\n");
		read(fd_uio_stream, (void *)&pending, sizeof(int)); // wait for rd interrupt
		__uint32_t tailLSB =  generateDescriptors(MMAP_DESCRIPTOR_BRAM, ADDRESS_DESCRIPTOR_BRAM, ADDRESS_HPO_RAM, BYTES_PER_DESCRIPTOR, n_descriptors); //write descriptors
		//set descriptors
		virtual_set(MMAP_DMA, 0x30, 0x5004); //reset DMA
		virtual_set(MMAP_DMA, 0x3C, 0x00000000); // set current description pointer MSB
		virtual_set(MMAP_DMA, 0x38, 0x40000000); // set current description pointer LSB
		virtual_set(MMAP_DMA, 0x30, 0x5001); // start dma engine
		virtual_set(MMAP_DMA, 0x44, 0x00000000); // set s2mm write tail descriptor MSB
		virtual_set(MMAP_DMA, 0x40, tailLSB); // set s2mm write tail descriptor LSB

		printf("Tail is 0x%08x\n", tailLSB);

		//set descriptors_ready flag
		virtual_set(MMAP_STREAM_MANAGER, 0x4, (0x1 ));

		//wait on intr
		printf("Waiting on DMA desc intr\n");
		read(fd_uio, (void *)&pending, sizeof(int));

		*((volatile unsigned long *) (ptr_uio + 0x34)) = 0x0001100A; //clear interrupt
		statusreg = virtual_get(MMAP_DMA, 0x34);

		if (statusreg & 0x4000)
		{
			printf("We got an Err_irq! Status reg is: 0x%x\n", statusreg);
			if (statusreg & 0x100)
				printf("SGIntErr: A descriptor with the Complete bit already set is fetched\n");

			exit(1);
		}

		for (int i = 0; i < n_descriptors; i++)
		{
			printf("0x%08x\n", (*(unsigned long* )(MMAP_RAM+(i*4))));

		}



		virtual_set(MMAP_STREAM_MANAGER, 0x4, (0x0 ));
		printf("\n");
	}


	statusreg = virtual_get(MMAP_DMA, 0x34);
  printf("All Complete\n");
  printf("Status Reg: 0x%x \n", statusreg);
  printf("Written %d MB\n", (BYTES_PER_DESCRIPTOR*n_descriptors)>>20);

	munmap(ptr_uio, gpio_size);
	munmap(MMAP_DESCRIPTOR_BRAM, 4096UL);
	munmap(MMAP_DMA, 4096UL);
	munmap(MMAP_DATA_GENERATOR, 4096UL);
	munmap(MMAP_STREAM_MANAGER, 4096UL);
	munmap(MMAP_RAM, 4096UL);
	munmap(MMAP_FIFO_RESET, 4096UL);
	close(memfd);
	close(fd_uio);
	close(fd_uio_stream);

  return 0;
}
