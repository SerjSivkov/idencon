# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'identicon/enums'

Gem::Specification.new do |spec|
  spec.name = 'identicon'
  spec.version = Identicon::Enums::VERSION
  spec.author = 'Sergey Sivkov'
  spec.email = 'serjsivkov@gmail.com'
  spec.homepage = 'https://github.com/SerjSivkov/identicon'
  spec.date = %q{2020-03-19}
  spec.license = 'MIT'
  spec.summary = %q{Identicon - generate image by name}
  spec.files = ['lib/identicon.rb']
  spec.require_paths = ['lib']

  spec.add_dependency 'chunky_png', '~> 1.3', '>= 1.3.5'
  spec.add_development_dependency 'bundler', '~> 2.1', '>= 2.1.4'
  spec.add_development_dependency 'rspec', '~> 3.9'
end
