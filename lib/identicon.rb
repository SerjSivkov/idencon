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

    puts "YOU ARE AWESOME!!"
  end

  private

  attr_reader :user_name, :path

  def save_image!;
  end
end
