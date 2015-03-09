# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'checksum'
  spec.version       = '0.0.1'
  spec.authors       = ['Artem Khramov']
  spec.email         = ['futu.fata@gmail.com']
  spec.summary       = %q{Module, containing a plenty of checksum algorithms}
  spec.description   = 'A Ruby library for checksums calculation'
  spec.homepage      = 'https://github.com/akhramov/checksums'
  spec.license       = 'MIT'
  spec.extensions << 'ext/Rakefile'
  spec.files = %w(Rakefile checksum.gemspec) + Dir.glob("{lib,spec,ext}/**/*")

  spec.require_paths = ['lib', 'ext']

  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_dependency 'rake', '~> 10.4'
  spec.add_dependency 'ffi-compiler', '~> 0.1'
end
