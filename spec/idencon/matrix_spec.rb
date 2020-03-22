# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Idencon::Matrix do
  describe '#generate_matrix' do
    it 'returns matrix' do
      hash_digest = Array.new(25, 0)
      result = described_class.generate_matrix(hash_digest)

      expect(result).not_to be_empty
      result.each do |array|
        expect(array).not_to be_empty
        expect(array.size).to eq(5)
      end
    end
  end

  describe '#transform_column_array' do
    context 'transform array' do
      it 'even-length array transformation' do
        array = [1, 2, 4, 5]
        expect(described_class.transform_column_array(array))
          .to eq([1, 2, 2, 1])
      end

      it 'odd-length array transformation' do
        array = [1, 2, 3, 4, 5]
        expect(described_class.transform_column_array(array))
          .to eq([1, 2, 3, 2, 1])
      end
    end
  end
end
