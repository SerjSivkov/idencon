# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'identicon/enums'

Gem::Specification.new do |spec|
  spec.name = %q{identicon}
  spec.version = Identicon::Enums::VERSION
  spec.authors = ['Sergey Sivkov']
  spec.email = ['serjsivkov@gmail.com']
  spec.date = %q{2020-03-19}
  spec.summary = %q{Identicon - generate image by name}
  spec.files = [
    'lib/identicon.rb'
  ]
  spec.require_paths = ['lib']

  spec.add_dependency 'chunky_png'
  spec.add_development_dependency 'bundler'
end
