require 'checksum/version'
require 'ffi'
require 'ffi-compiler/loader'

module Checksum
  extend FFI::Library
  ffi_lib FFI::Compiler::Loader.find('checksums')

  attach_function :example, [], :void
  attach_function :bsd, [:string, :int], :size_t
  private_class_method :bsd

  %w(16 32 64).each do |size|
  	define_singleton_method("bsd#{size}") { |arg| bsd(arg, size.to_i) }
  end

end
