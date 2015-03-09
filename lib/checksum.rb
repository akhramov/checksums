require 'checksum/version'
require 'ffi'
require 'ffi-compiler/loader'

module Checksum
  extend FFI::Library
  ffi_lib FFI::Compiler::Loader.find('checksums')

  attach_function :example, [], :void
  attach_function :crc, [:string, :ulong_long, :ulong_long, :int, :bool], :size_t

  attach_function :bsd, [:string, :int], :size_t
  private_class_method :bsd

  def self.crc32(str)
  	crc(str, 0xFFFFFFFF, 0xedb88320, 32, true)
  end

  def self.crc16(str)
  	crc(str, 0, 0xA001, 16, false)
  end

  %w(16 32 64).each do |size|
  	define_singleton_method("bsd#{size}") { |str| bsd(str, size.to_i) }
  end

end
