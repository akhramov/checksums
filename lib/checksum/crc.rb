module Checksum::CRC
  extend Helpers
  extend FFI::Library
  ffi_lib FFI::Compiler::Loader.find('crc')

  attach_function :crc, [:string, :ulong_long, :ulong_long, :int, :ulong_long, :bool], :size_t
  private_class_method :crc
  
  # CRC-32
  generate_sum_method(initial_value: 0xFFFFFFFF, polynomial: 0xedb88320, width: 32, xor: 0xFFFFFFFF, reflected: true)
  # CRC-32-bzip2
  generate_sum_method(initial_value: 0xFFFFFFFF, polynomial: 0x04c11db7, width: 32, xor: 0xFFFFFFFF, name: 'bzip2', reflected: false)
  # CRC-31-PHILIPS
  generate_sum_method(initial_value: 0x7FFFFFFF, polynomial: 0x04c11db7, width: 31, xor: 0x7FFFFFFF, name: 'philips', reflected: false)
  # CRC-24
  generate_sum_method(initial_value: 0xB704CE, polynomial: 0x864CFB, width: 24, xor: 0, reflected: false)
  # CRC-16
  generate_sum_method(initial_value: 0, polynomial: 0xA001, width: 16, xor: 0, reflected: true)
  # CRC-16-MODBUS
  generate_sum_method(initial_value: 0xFFFF, polynomial: 0xA001, width: 16, xor: 0, name: 'modbus', reflected: true)
  # CRC-16-DNP
  generate_sum_method(initial_value: 0, polynomial: 0xA6BC, width: 16, xor: 0xFFFF, name: 'dnp', reflected: true)
  # CRC-15
  generate_sum_method(initial_value: 0, polynomial: 0x4599, width: 15, xor: 0, reflected: false)
  # CRC-12-CDMA2000
  generate_sum_method(initial_value: 0xFFF, polynomial: 0xF13, width: 12, xor: 0, name: 'cdma2000', reflected: false) 
  # CRC-8-I-CODE
  generate_sum_method(initial_value: 0xFD, polynomial: 0x1D, width: 8, xor: 0, name: 'i_code', reflected: false)
 end