/*
 * registers.h
 *
 *  Created on: Dec 6, 2017
 *      Author: adam
 */

#ifndef REGISTERS_H_
#define REGISTERS_H_

#include <stdlib.h>


__uint32_t virtual_get(__uint32_t * virtual_mem, __uint32_t offset);
void virtual_set(__uint32_t * virtual_mem, __uint32_t offset, __uint32_t value);


typedef struct S2MM_DMACR {
    __uint32_t RS : 1;
    __uint32_t    : 1;
    __uint32_t RESET : 1;
    __uint32_t KEYHOLE : 1;
    __uint32_t CYCLIC : 1;
    __uint32_t : 7;
    __uint32_t IOC_IRQEN : 1;
    __uint32_t DLY_IRQEN : 1;
    __uint32_t ERR_IRQEN : 1;
    __uint32_t : 1;
    __uint32_t IRQThreshold : 8;
    __uint32_t IRQDelay : 8;
}S2MM_DMACR ;

typedef struct S2MM_DMASR {
    __uint32_t HALTED : 1;
    __uint32_t IDLE   : 1;
    __uint32_t  : 1;
    __uint32_t SGINCLD : 1;
    __uint32_t DMAINTERR : 1;
    __uint32_t DMASLVERR : 1;
    __uint32_t DMADECERR : 1;
    __uint32_t  : 1;
    __uint32_t SGINTERR : 1;
    __uint32_t SGSLVERR: 1;
    __uint32_t SGDECERR : 1;
    __uint32_t  : 1;
    __uint32_t IOC_IRW : 1;
    __uint32_t DLY_IRQ : 1;
    __uint32_t  ERR_IRQ :1;
    __uint32_t  : 1;
    __uint32_t  IRQTHRESHOLDS : 8;
    __uint32_t IRQDLYS : 8;
}S2MM_DMASR ;

#endif /* REGISTERS_H_ */
