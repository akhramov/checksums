module Checksum::BSD
	extend FFI::Library 
  ffi_lib FFI::Compiler::Loader.find('bsd')

  attach_function :bsd, [:string, :int], :size_t
  private_class_method :bsd

  %w(16 32 64).each do |size|
    define_singleton_method("bsd#{size}") { |str| bsd(str, size.to_i) }
  end
end