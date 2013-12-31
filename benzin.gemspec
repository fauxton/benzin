# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'benzin/version'

Gem::Specification.new do |spec|
  spec.name          = "benzin"
  spec.version       = Benzin::VERSION
  spec.authors       = ["Curtis Ekstrom"]
  spec.email         = ["ce@canvus.io"]
  spec.description   = %q{Generate new embeddable Rails Engines within Rails-API projects}
  spec.summary       = %q{Base Rails engines with RSpec made for Rails-API projects at fauxton}
  spec.homepage      = "https://www.github.com/fauxton/benzin"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 4.0.2"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
