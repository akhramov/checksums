require 'spec_helper'
require 'checksum'

shared_examples 'correct checksum' do |meth, sum|
  context 'With non-empty string' do
    it 'counts checksum right' do
      expect(meth.call('123456789')).to eq sum
    end
  end
end

check_values = {
  crc32: 0xCBF43926,
  crc31philips: 0x0CE9E46C,
  crc32bzip2: 0xFC891918,
  crc24: 0x21CF02,
  crc16: 0xBB3D,
  crc16modbus: 0x4B37,
  crc16dnp: 0xEA82,
  crc15: 0x059E,
  crc12cdma2000: 0xD4D,
  crc8i_code: 0x7E
}

check_values.each do |method, check_value|
  describe Checksum::CRC, "::#{method}" do
    it_behaves_like('correct checksum', Checksum::CRC.method(method), check_value)
  end 
end
