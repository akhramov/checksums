#include <stdint.h>
#include <limits.h>
#include <string.h>

#ifndef CRC_CHECKSUM_H
#define CRC_CHECKSUM_H

#define REMAINDER(elem, polynomial) (elem) = ((elem) & 1) ? (elem) >> 1 ^ (polynomial) : (elem) >> 1
#define UNSET_BITS(elem, size) ((elem) & (ULONG_MAX >> (8 * sizeof(uintmax_t) - (size))))

uint32_t crc32(const unsigned char *data);

#endif