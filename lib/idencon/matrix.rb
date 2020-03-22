# frozen_string_literal: true

require 'idencon/enums'

module Idencon
  class Matrix
    class << self
      def generate_matrix(hash_digest)
        matrix = hash_digest.each_slice(Idencon::Enums::Image::COLUMN_COUNT)
        matrix.to_a[0...Idencon::Enums::Image::COLUMN_COUNT]
      end

      def transform_column_array(array)
        index = 0
        while index < middle_column_array_index
          array[-(index + 1)] = array[index]
          index += 1
        end
        array
      end

      private

      def middle_column_array_index
        @middle_index ||= Idencon::Enums::Image::COLUMN_COUNT / 2 + Idencon::Enums::Image::COLUMN_COUNT % 2
      end
    end
  end
end
