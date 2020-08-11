# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "model_coder/version"

Gem::Specification.new do |spec|
  spec.name          = "model_coder"
  spec.version       = ModelCoder::VERSION
  spec.authors       = ["Maxim Larionov"]
  spec.email         = ["makcimka1994@gmail.com.com"]

  spec.summary       = %q{Encoder/Decoder for model information}
  spec.description   = %q{Module for dealing with abstraction over model,
    coding their data to unified format and being able to code to/from}
  spec.homepage      = "https://github.com/maximlarionov/model_coder"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'jwt'
  spec.add_dependency 'activesupport'
  spec.add_dependency 'urlcrypt', '~> 0.1.1'

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
