require 'checksum/version'
require 'ffi'
require 'ffi-compiler/loader'

module Checksum
  extend FFI::Library
  ffi_lib FFI::Compiler::Loader.find('checksums')

  attach_function :example, [], :void
end
