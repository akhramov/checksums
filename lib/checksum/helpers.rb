module Helpers
  #
  # Generates an crc* method
  # @param hash [Hash] hash with params for generated method:
  #   {
  #     initial_value: int_val, # initial value eg. 0xFFFFFFFF for CRC-32
  #     polynomial: int_val,    # polynomial (reverse in case of reflected method) 
  #                             # eg.  0xedb88320 for CRC-32
  #     width: int_val,         # width of sum eg. 32 for CRC-32
  #     xor: int_val,           # Number with which result will be XORed.
  #     reflected: bool         # is method reflected?
  #     name: string            # (optional) sets name of algorythm eg. dnp for CRC-16-DNP
  #   }
  # 
  # @return [Symbol] name of newly generated method.
  def generate_sum_method(hash)
    define_singleton_method("crc#{hash[:width]}#{hash[:name]}") do |str|
      crc(str, 
        hash[:initial_value],
        hash[:polynomial],
        hash[:width],
        hash[:xor]
      ) 
    end
  end
end