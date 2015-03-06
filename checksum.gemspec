# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'checksum/version'

Gem::Specification.new do |spec|
  spec.name          = 'checksum'
  spec.version       = Checksum::VERSION
  spec.authors       = ['Artem Khramov']
  spec.email         = ['futu.fata@gmail.com']
  spec.summary       = %q{Module, containing a plenty of checksum algorithms}
  spec.description   = ''
  spec.homepage      = ''
  spec.license       = 'MIT'
  spec.extensions << 'ext/Rakefile'
  spec.files = %w(Rakefile checksum.gemspec) + Dir.glob("{lib,spec,ext}/**/*")

  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_dependency 'rake'
  spec.add_dependency 'ffi-compiler'
end
