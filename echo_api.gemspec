# frozen_string_literal: true

require_relative "lib/echo_api/version"

Gem::Specification.new do |spec|
  spec.name = "echo_api"
  spec.version = EchoApi::VERSION
  spec.authors = ["jovan-sremacki"]
  spec.email = ["jovansr@protonmail.com"]

  spec.summary = "Easily mock API endpoints"
  spec.description = "EchoAPI is a Ruby gem designed to simplify the process of mocking and simulating external API calls. 
  Ideal for both development and testing environments, 
  EchoApi enables developers to define customizable responses to API requests, 
  helping to ensure that applications behave as expected without the need to make real network requests. 
  With EchoApi, you can easily simulate various API scenarios including success responses, errors, and edge cases."

  spec.homepage = "https://github.com/jovan-sremacki/echo-api"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jovan-sremacki/echo-api"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
