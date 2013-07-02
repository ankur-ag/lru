# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lru/version'

Gem::Specification.new do |spec|
  spec.name          = "lru"
  spec.version       = Lru::VERSION
  spec.authors       = ["ankur@leaf.me"]
  spec.email         = ["ankur@leaf.me"]
  spec.description   = %q{LRU cache implementation}
  spec.summary       = %q{LRU cache implementation}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
