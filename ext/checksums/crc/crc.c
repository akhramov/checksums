//=======================================================================
// Copyright Artem Khramov 2015
// Distributed under the MIT License.
// (See accompanying file LICENSE.txt or copy at
//  http://opensource.org/licenses/MIT)
//=======================================================================

#include "crc.h"

uint32_t table[256];

void 
gen_table_refl(int polynomial, int size)
{
	uint32_t rem;
	for (int i = 0; i < 256; i++) {
		rem = i; 
		for (int j = 0; j < 8; j++) {
			REMAINDER(rem, polynomial);
		}
		table[i] = UNSET_BITS(rem, size);

	}
}

void 
gen_table(int polynomial, int size)
{
	uint32_t rem, j, i;
	for (i = 0; i < 256; i++) {
		rem = i << size - 8;
		for (j = 0; j < 8; j++ ) {
			if (rem & LEFTMOST_BIT(size)) {
				rem = (rem << 1) ^ polynomial;
			} else {
				rem = rem << 1;
			}
		}
		table[i] = rem;
	}
}



uintmax_t
crc(const unsigned char *buf, uintmax_t init, uintmax_t polynomial, uint32_t size, uintmax_t xor, short reflected)
{
	uintmax_t crc = init;
	size_t len = strlen(buf);

	if (len) {
		if (reflected) {
	 		gen_table_refl(polynomial, size);	
			while (len --) {
				crc = (crc >> 8) ^ table[(crc & 0xFF) ^ *buf++];
			}
	 	} else {
			gen_table(polynomial, size);		 
			while (len --) {
				crc = (crc << 8) ^ table[((crc >> size - 8) ^ *buf++) & 0xFF];
			}
	 	}
 	}

	return REM_LEFTMOST_BITS(crc ^ xor, size);
}