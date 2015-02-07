# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'strava_cli/version'

Gem::Specification.new do |spec|
  spec.name          = "strava_cli"
  spec.version       = StravaCli::VERSION
  spec.authors       = ["Andrew Olson"]
  spec.email         = ["anolson@gmail.com"]
  spec.summary       = %q{Strava command-line interface.}
  spec.description   = %q{A command-line tool for interacting with Strava.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "dotenv", "~> 1.0.2"
  spec.add_dependency "faraday", "~> 0.9.0"
  spec.add_dependency "launchy", "~> 2.4.3"
  spec.add_dependency "sinatra", "~> 1.4.5"
  spec.add_dependency "reel", "~> 0.5.0"
  spec.add_dependency "netrc", "~> 0.10.2"
  spec.add_dependency "thor", "~> 0.19.1"
end
