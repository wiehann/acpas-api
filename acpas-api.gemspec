# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'acpas/api/version'

Gem::Specification.new do |spec|
  spec.name          = "acpas-api"
  spec.version       = Acpas::API::VERSION::STRING
  spec.authors       = ["jeriko", "pokey"]
  spec.email         = ["whoisdanieldavey@gmail.com"]
  spec.description   = %q{Acpas API wrapper}
  spec.summary       = %q{Provides Acpas API operations}
  spec.homepage      = "https://github.com/recombinary/acpas-api"
  spec.license       = "GNU v3"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 4.0", "< 6.1"
  spec.add_dependency "active_attr"
  spec.add_dependency "savon"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
end
