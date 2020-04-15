/*
 * registers.c
 *
 *  Created on: Dec 6, 2017
 *      Author: adam
 */

#include "registers.h"

__uint32_t virtual_get(__uint32_t * virtual_mem, __uint32_t offset)
 {
 	return virtual_mem[offset>>2];
 }

 void virtual_set(__uint32_t * virtual_mem, __uint32_t offset, __uint32_t value)
 {
 	virtual_mem[offset>>2] = value;
 }


