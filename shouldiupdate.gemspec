# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shouldiupdate/version'

Gem::Specification.new do |spec|
  spec.name          = "should-i-update"
  spec.version       = ShouldIUpdate::VERSION
  spec.authors       = ["coder36"]
  spec.email         = ["markymiddleton@gmail.com"]

  spec.summary       = %q{Should I update my gem's ?}
  spec.description   = %q{should-i-update takes a friendly look your Gemfile and reports any out of date gems}
  spec.homepage      = "https://github.com/coder36/should-i-update"
  spec.license       = %q{MIT}

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
