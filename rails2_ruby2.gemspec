# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails2_ruby2/version'

Gem::Specification.new do |spec|
  spec.name          = "rails2_ruby2"
  spec.version       = Rails2Ruby2::VERSION
  spec.authors       = ["Andrew Warner", "Mat Brown"]
  spec.email         = ["andrew@genius.com", "mat@genius.com"]

  spec.summary       = %q{Patches to run rails 2 with ruby 2}
  spec.description   = %q{Patches to run rails 2 with ruby 2}
  spec.homepage      = "https://github.com/Genius/rails2_ruby2"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "syck", "~> 1.4"
  spec.add_dependency 'iconv'

  spec.required_ruby_version = '>= 2.0'
end
