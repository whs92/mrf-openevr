#include "descriptors.h"

void dumpdata(int  memfd, uint bytes)
{
	FILE *ptr_fp;

	if((ptr_fp = fopen("/home/root/test.txt", "wb")) == NULL)
		{
			printf("Unable to create file!\n");
			exit(1);
		}else printf("Opened file successfully for writing.\n");

    void * MMAP_RAM = mmap(0, bytes, PROT_READ | PROT_WRITE, MAP_SHARED, memfd, 0x20000000);

	if( fwrite(MMAP_RAM, bytes, 1, ptr_fp) != 1)
		{
			printf("Write error!\n");
			exit(1);
		}else printf("Write was successful.\n");
		fclose(ptr_fp);

    munmap(MMAP_RAM, bytes);
}

__uint32_t generateDescriptors(void * bramMmap,__uint32_t bramAddress, __uint32_t destAddress , __uint32_t bytesPerDescriptor, __uint32_t noDescriptors)
{
	descriptor *arrayOfDescriptors = malloc(noDescriptors * sizeof(descriptor));
	__uint32_t additional_control = 0;

	for(__uint32_t a = 0; a < noDescriptors; a++)
	{

		__uint32_t nextAddress;
		if (a == (noDescriptors - 1)){
			nextAddress = bramAddress;
		}
		else {
			nextAddress = ((a+1)*64)+bramAddress;
		}

		if ( a == 0)
			additional_control = 0x8000000;
		else if (a == noDescriptors)
			additional_control = 0x4000000;
		else
			additional_control = 0x4000000;

		arrayOfDescriptors[a] = (descriptor) {
	        .NXTDESC = nextAddress, .NXTDESC_MSB = 0x00000000,
	        .BUFFER_ADDRESS = (destAddress + (a*bytesPerDescriptor)), .BUFFER_ADDRESS_MSB= 0x00000000,
	        .CONTROL = (0x0c000000 + bytesPerDescriptor), .STATUS = 0x00000000
	};
	}

    memcpy(bramMmap,arrayOfDescriptors,sizeof(descriptor)*noDescriptors);
    free(arrayOfDescriptors);

    return ((noDescriptors-1)*64)+bramAddress;
}
