/*
 * descriptors.h
 *
 *  Created on: Dec 6, 2017
 *      Author: adam
 */

#ifndef DESCRIPTORS_H_
#define DESCRIPTORS_H_

#include <sys/mman.h>
#include <stdio.h>
#include <stdlib.h>

__uint32_t generateDescriptors(void * bramMmap,__uint32_t bramAddress, __uint32_t destAddress , __uint32_t bytesPerDescriptor, __uint32_t noDescriptors);
void dumpdata(int  memfd, uint bytes);

/*
 * descriptor d1 = {
        .NXTDESC = 0x40000020, .NXTDESC_MSB = 0x00000000,
        .BUFFER_ADDRESS = 0x20000000, .BUFFER_ADDRESS_MSB= 0x00000000,
        .CONTROL = 0x0c000200, .STATUS = 0x00000000
};
 *
 */

typedef struct descriptor {
    __uint32_t NXTDESC : 32;
    __uint32_t NXTDESC_MSB : 32;
    __uint32_t BUFFER_ADDRESS : 32;
    __uint32_t BUFFER_ADDRESS_MSB : 32;
    __uint32_t : 32;
    __uint32_t : 32;
    __uint32_t CONTROL : 32;
    __uint32_t STATUS : 32;
    __uint64_t : 64; //descriptors must be 16-word aligned (16*4= 64 byte aligned) hence the 32 byte padding
    __uint64_t : 64;
    __uint64_t : 64;
    __uint64_t : 64;
}descriptor ;



#endif /* DESCRIPTORS_H_ */
