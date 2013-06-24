# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mp3_player/version'

Gem::Specification.new do |spec|
  spec.name          = 'mp3_player'
  spec.version       = Mp3Player::VERSION
  spec.authors       = ['Gavin Morrice', 'Alexander Zubkov']
  spec.email         = ['info@zubkov.info']
  spec.description   = %q{WordPress Audio Player plugin wrapper for Rails 3.x with asset pipeline support}
  spec.summary       = %q{WordPress Audio Player plugin wrapper for Rails 3.x with asset pipeline support}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
