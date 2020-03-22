# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'idencon/version'

Gem::Specification.new do |spec|
  spec.name = 'idencon'
  spec.version = Idencon::VERSION
  spec.author = 'Sergey Sivkov'
  spec.email = 'serjsivkov@gmail.com'
  spec.homepage = 'https://github.com/SerjSivkov/idencon'
  spec.date = %q{2020-03-19}
  spec.license = 'MIT'
  spec.summary = %q{Idencon - generate image by name}

  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.files = Dir['{lib}/**/*.rb', '{lib}/*.rb', 'LICENSE', 'README.md']
  spec.require_paths = ['lib']

  spec.add_dependency 'chunky_png', '~> 1.3', '>= 1.3.5'
  spec.add_development_dependency 'bundler', '~> 2.1', '>= 2.1.4'
  spec.add_development_dependency 'rspec', '~> 3.9'
end
