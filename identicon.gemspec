# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = %q{identicon}
  spec.version = '0.0.0'
  spec.authors = ['Sergey Sivkov']
  spec.email = ['serjsivkov@gmail.com']
  spec.date = %q{2020-03-19}
  spec.summary = %q{Identicon - generate image by name}
  spec.files = [
    'lib/identicon_gem.rb'
  ]
  spec.require_paths = ['lib']
  spec.add_dependency 'chunky_png'
end
