# frozen_string_literal: true

require 'chunky_png'

module Identicon
  module Enums
    VERSION = '0.1.0'

    class Image
      SQUARE_SIZE = 250
      ROW_COUNT = 5
      COLUMN_COUNT = 5
      PIXEL_SIZE = SQUARE_SIZE / ROW_COUNT
      BACKGROUND_COLOR = ChunkyPNG::Color.rgb(255, 255, 255)
    end
  end
end
