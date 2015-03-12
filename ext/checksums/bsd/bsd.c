//=======================================================================
// Copyright Artem Khramov 2015
// Distributed under the MIT License.
// (See accompanying file LICENSE.txt or copy at
//  http://opensource.org/licenses/MIT)
//=======================================================================

#include "bsd.h"

#define SHIFT(elem, size) (elem) = (((elem) >> 1) | ((elem & 1) << (size) - 1))
#define CLEAR_BITS(elem, size) (((elem) << (size)) >> (size)) 


size_t 
bsd(const unsigned char *data, int size) 
{
	int remain = 64 - size;
	uint64_t checksum = 0;
	size_t len = strlen(data);

	for (size_t i = 0; i < len; i++) {
		SHIFT(checksum, size);
		checksum  += data[i];
		checksum &= 0xffffffff;
	}
	return CLEAR_BITS(checksum, remain);
}