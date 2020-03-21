# frozen_string_literal: true

require 'chunky_png'
require 'digest/md5'
require 'identicon/enums'

class Identicon
  def initialize(user_name, path = nil)
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
    @image = ChunkyPNG::Image.new(Identicon::Enums::Image::SQUARE_SIZE,
                                  Identicon::Enums::Image::SQUARE_SIZE,
                                  Identicon::Enums::Image::BACKGROUND_COLOR)
  end

  def draw_texture
    matrix.each_with_index do |array_value, row_index|
      array_value.each_with_index do |value, column_index|
        draw_square(value, row_index, column_index)
      end
    end
  end

  def save_image!
    image.save("#{path_directory}/#{user_name}.png", :fast_rgba)
  end

  def matrix
    matrix = hash_digest.each_slice(Identicon::Enums::Image::COLUMN_COUNT)
    matrix.to_a[0...Identicon::Enums::Image::COLUMN_COUNT]
  end

  def draw_square(value, row_index, column_index)
    color = paint_pixel?(value) ? texture_color : Identicon::Enums::Image::BACKGROUND_COLOR
    image.rect(
      column_index * Identicon::Enums::Image::PIXEL_SIZE, row_index * Identicon::Enums::Image::PIXEL_SIZE,
      (column_index + 1) * Identicon::Enums::Image::PIXEL_SIZE, (row_index + 1) * Identicon::Enums::Image::PIXEL_SIZE,
      ChunkyPNG::Color::TRANSPARENT,
      color
    )
  end

  def paint_pixel?(byte)
    (byte % user_name.size % 2).zero?
  end

  def texture_color
    red, green, blue = hash_digest[0..2]
    ChunkyPNG::Color.rgb(red, green, blue)
  end

  def hash_digest
    @hash_digest ||= Digest::MD5.hexdigest(user_name).bytes
  end

  def path_directory
    path || __dir__
  end
end
