# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'no_cache_control/version'

Gem::Specification.new do |spec|
  spec.name          = "no_cache_control"
  spec.version       = NoCacheControl::VERSION
  spec.authors       = ["Tomas Valent"]
  spec.email         = ["equivalent@eq8.eu"]
  spec.summary       = %q{ Sets rails Cache-Control to no-cache }
  spec.description   = "Sets browser caching headers on Rails app so that " +
                       "caching of pages within will be disabled"
  spec.homepage      = "https://github.com/equivalent/no_cache_control"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
