# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'icon_generator/version'

Gem::Specification.new do |spec|
  spec.name          = "icon_generator"
  spec.version       = IconGenerator::VERSION
  spec.authors       = ["Adam Bowen"]
  spec.email         = ["adambowen@group360.com"]
  spec.description   = %q{Generates Apple Touch Icons or a favicon given a square image.}
  spec.summary       = %q{Make apple-touch-icons and favicon.ico files}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = ["icon_generator"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "thor", "0.18.1"

  spec.requirements << 'imagemagick'
end
