//=======================================================================
// Copyright Artem Khramov 2015
// Distributed under the MIT License.
// (See accompanying file LICENSE.txt or copy at
//  http://opensource.org/licenses/MIT)
//=======================================================================

#include <stdint.h>
#include <string.h>

#ifndef BSD_CHECKSUM_H
#define BSD_CHECKSUM_H

size_t bsd(const unsigned char *data, int size);

#endif