//=======================================================================
// Copyright Artem Khramov 2015
// Distributed under the MIT License.
// (See accompanying file LICENSE.txt or copy at
//  http://opensource.org/licenses/MIT)
//=======================================================================

#include "crc.h"

uint32_t table[256];

void 
gen_table(int polynomial, int size)
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

uintmax_t
crc(const unsigned char *buf, uintmax_t init, uintmax_t polynomial, uint32_t size, uintmax_t xor)
{
	// 0xedb88320
	// 32
	uintmax_t crc = init;
	size_t len = strlen(buf);
 
 	gen_table(polynomial, size);
 
	while (len --) {
		crc = (crc >> 8) ^ table[(crc & 0xFF) ^ *buf++];
	}

	return REM_LEFTMOST_BITS(crc ^ xor, size);
}

uint16_t
crc16(const unsigned char *buf)
{
	uint16_t crc = 0;
	size_t len = strlen(buf);
 
 	gen_table(0xA001, 16);

	while(len --) {
		crc = (crc >> 8) ^ table[(crc & 0xFF) ^ *buf++];
	}

	return crc;
}