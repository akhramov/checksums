require 'spec_helper'
require 'checksum'

describe Checksum::CRC, '::crc32' do
	context 'with empty string' do
		it 'returns zero' do
			expect(Checksum::CRC.crc32('')).to eq 0
		end
	end

  context 'With non-empty string' do
    it 'counts checksum right' do
      expect(Checksum::CRC.crc32('123456789')).to eq 0xCBF43926
    end
  end
end
