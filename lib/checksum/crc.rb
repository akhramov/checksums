module Checksum::CRC
  extend Helpers
  extend FFI::Library
  ffi_lib FFI::Compiler::Loader.find('crc')

  attach_function :crc, [:string, :ulong_long, :ulong_long, :int, :ulong_long], :size_t
  private_class_method :crc
  
  # CRC-32
  generate_sum_method(initial_value: 0xFFFFFFFF, polynomial: 0xedb88320, width: 32, xor: 0xFFFFFFFF)
  # CRC-16
  generate_sum_method(initial_value: 0, polynomial: 0xA001, width: 16, xor: 0)
  # CRC-16-IBM
  generate_sum_method(initial_value: 0xFFFF, polynomial: 0xA001, width: 16, xor: 0, name: 'ibm')
  # CRC-16-CCIT
  generate_sum_method(initial_value: 0xFFFF, polynomial: 0x8408, width: 16, xor: 0, name: 'ccit')
  # CRC-16-DNP
  generate_sum_method(initial_value: 0, polynomial: 0xA6BC, width: 16, xor: 0xFFFF, name: 'dnp')

end