# frozen_string_literal: true

require 'chunky_png'
require 'digest/md5'
require 'idencon/enums'
require 'idencon/matrix'

module Idencon
  ##
  # class for generate image by @user_name
  class Identicon
    BACKGROUND_COLOR = ChunkyPNG::Color.rgb(255, 255, 255)

    def initialize(user_name, path)
      @user_name = user_name
      @path = path
    end

    def generate
      validate
      create_image
      draw_texture
      save_image!
    end

    private

    attr_reader :user_name, :path
    attr_accessor :image

    def validate
      raise 'User_name cannot be nil' if user_name.nil? || user_name.empty?
    end

    def create_image
      @image = ChunkyPNG::Image.new(Idencon::Enums::Image::SQUARE_SIZE,
                                    Idencon::Enums::Image::SQUARE_SIZE,
                                    BACKGROUND_COLOR)
    end

    def draw_texture
      matrix.each_with_index do |array_value, row_index|
        array_value = Idencon::Matrix.transform_column_array(array_value)
        array_value.each_with_index do |value, column_index|
          draw_square(value, row_index, column_index)
        end
      end
    end

    def save_image!
      image.save("#{path_directory}/#{user_name}.png", :fast_rgba)
    end

    def matrix
      Idencon::Matrix.generate_matrix(hash_digest)
    end

    def draw_square(value, row_index, column_index)
      color = paint_pixel?(value) ? texture_color : BACKGROUND_COLOR
      image.rect(coordinate(column_index), coordinate(row_index),
                 coordinate(column_index + 1), coordinate(row_index + 1),
                 ChunkyPNG::Color::TRANSPARENT,
                 color)
    end

    def paint_pixel?(byte)
      (byte % user_name.size % 2).zero?
    end

    def texture_color
      red, green, blue = hash_digest[0..2]
      ChunkyPNG::Color.rgb(red, green, blue)
    end

    def coordinate(index)
      index * Idencon::Enums::Image::PIXEL_SIZE
    end

    def hash_digest
      @hash_digest ||= Digest::MD5.hexdigest(user_name).bytes
    end

    def path_directory
      path || __dir__
    end
  end
end
