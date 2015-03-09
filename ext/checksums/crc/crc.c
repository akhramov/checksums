#include "crc.h"

uint32_t table[256];

void 
gen_table(int polynomial, int size)
{
	uint32_t rem;
	for (int i = 0; i < 256; i++) {
		rem = i; 
		for (int j = 0; j < 8; j++) {
			REMAINDER(rem, 0xedb88320);
		}
		table[i] = UNSET_BITS(rem, size);
	}

}

uint32_t
crc32(const unsigned char *buf)
{
	uint32_t crc = 0;
	size_t len = strlen(buf);
	uint8_t octet;
 
 	gen_table(0xedb88320, 32);
 
	crc = ~crc;
	char *q = buf + len;
	for (char *p = buf; p < q; p ++) {
		octet = *p;
		crc = (crc >> 8) ^ table[(crc & 0xff) ^ octet];
	}
	return ~crc;
}