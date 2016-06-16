# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fe_core_ext/version'

Gem::Specification.new do |spec|
  spec.name          = "fe_core_ext"
  spec.version       = FeCoreExt::VERSION
  spec.authors       = ["Tetsu"]
  spec.email         = ["eisensand@gmail.com"]

  spec.summary       = %q{Core class extensions}
  spec.description   = %q{Core class extensions that doesn't supported by active_recored core_ext}
  spec.homepage      = "http://github.com/ironsand/fe_core_ext"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency 'selenium-webdriver'
end
