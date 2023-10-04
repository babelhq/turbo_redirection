# frozen_string_literal: true

require_relative "lib/turbo_redirection/version"

Gem::Specification.new do |spec|
  spec.name = "turbo_redirection"
  spec.version = TurboRedirection::VERSION
  spec.authors = ["BabelHQ"]
  spec.email = ["tech@babelhq.dk"]

  spec.summary = "A collection of reusable modules for Turbo Redirection."
  spec.homepage = "https://github.com/babelhq/turbo_redirection"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files = Dir["{app,lib}/**/*", "Rakefile", "README.md"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
