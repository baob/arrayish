# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'arrayish/version'

Gem::Specification.new do |spec|
  spec.name          = "arrayish"
  spec.version       = Arrayish::VERSION
  spec.authors       = ["baob"]
  spec.email         = ["coder@onesandthrees.com"]
  spec.description   = %q{ The gem introduces the Arrayish::String class, a string that has some array characteristics. }
  spec.summary       = %q{ Arrayish::String simplifies and DRYs code where an array appears in a string with delimiters. }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "terminal-notifier-guard"
end
