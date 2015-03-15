module Helpers
  #
  # Generates an crc* method
  # @param hash [Hash] hash with params for generated method:
  # 
  #     * <tt>:initial_value</tt> - Initial value eg. 0xFFFFFFFF for CRC-32.
  #     * <tt>:polynomial</tt> - Polynomial (reverse in case of reflected method) eg.  0xedb88320 for CRC-32.
  #     * <tt>:width</tt> - Width of sum eg. 32 for CRC-32.
  #     * <tt>:xor</tt> - Number with which result will be XORed.
  #     * <tt>:reflected</tt> - Is method reflected?
  #     * <tt>:name</tt> - (optional) sets name of algorythm eg. dnp for CRC-16-DNP
  #
  # @return [Symbol] name of newly generated method.
  def generate_sum_method(hash)
    define_singleton_method("crc#{hash[:width]}#{hash[:name]}") do |str|
      crc(str, 
        hash[:initial_value],
        hash[:polynomial],
        hash[:width],
        hash[:xor],
        hash[:reflected]
      ) 
    end
  end
end
