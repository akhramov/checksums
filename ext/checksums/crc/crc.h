#include <stdint.h>
#include <limits.h>
#include <string.h>

#ifndef CRC_CHECKSUM_H
#define CRC_CHECKSUM_H

#define REST(size) (8 * sizeof(uintmax_t) - (size))
#define REMAINDER(elem, polynomial) (elem) = ((elem) & 1) ? (elem) >> 1 ^ (polynomial) : (elem) >> 1
#define UNSET_BITS(elem, size) ((elem) & (ULONG_MAX >> REST(size)))
#define REM_LEFTMOST_BITS(elem, size) (((elem) <<  REST(size)) >> (REST(size)))

uintmax_t crc(const unsigned char *buf, uintmax_t init, uintmax_t polynomial, uint32_t size, uintmax_t xor);
uint16_t crc16(const unsigned char *data);

#endif