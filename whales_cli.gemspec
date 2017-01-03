# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'whales_cli/version'

Gem::Specification.new do |spec|
  spec.name          = "whales_cli"
  spec.version       = WhalesCli::VERSION
  spec.authors       = ["Roberto Quintanilla", "Abraham Kuri", "Cejas"]
  spec.email         = ["weare@icalialabs.com"]

  spec.summary       = %q{ A command line interface to tame Belugas }
  spec.description   = %q{ A command line interface to tame Belugas written in Ruby }
  spec.homepage      = "https://github.com/IcaliaLabs/whales_api"
  spec.license       = "MIT"

  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "pry", "~> 0.10"
  spec.add_dependency "thor", "~> 0.19"
  spec.add_dependency "httparty", "~> 0.14"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
