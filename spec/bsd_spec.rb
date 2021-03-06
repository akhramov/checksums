require 'spec_helper'
require 'checksum'

describe Checksum::BSD, '::bsd16' do
	context 'with empty string' do
		it 'returns zero' do
			expect(Checksum::BSD.bsd16('')).to eq 0
		end
	end

  context 'With non-empty string' do
    it 'counts checksum right' do
      expect(Checksum::BSD.bsd16(SAD_TEXT)).to eq 37389 # http://goo.gl/bc1fwg
    end
  end
end


