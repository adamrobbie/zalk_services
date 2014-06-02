# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zalk_services/version'

Gem::Specification.new do |spec|
  spec.name          = "zalk_services"
  spec.version       = ZalkServices::VERSION
  spec.authors       = ["Adam Robbie"]
  spec.email         = ["adam.robbie@gmail.com"]
  spec.summary       = "Ruby wrapper for internal Zalk services"
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rest_client"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
