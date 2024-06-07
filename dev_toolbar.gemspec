# frozen_string_literal: true

require_relative "lib/dev_toolbar/version"

Gem::Specification.new do |spec|
  spec.name = "dev_toolbar"
  spec.version = DevToolbar::VERSION
  spec.authors = ["Ben Purinton"]
  spec.email = ["ben@firstdraft.com"]

  spec.summary = "A development toolbar for Rails applications."
  spec.description = "A sticky toolbar for Rails applications in development mode"
  spec.homepage = "https://github.com/firstdraft"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/firstdraft/dev_toolbar"

  spec.files = Dir["lib/**/*", "app/**/*"]
  spec.bindir = "exe"
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 7.0"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
end
