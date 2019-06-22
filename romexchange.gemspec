lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "romexchange/version"

Gem::Specification.new do |spec|
  spec.name          = "romexchange"
  spec.version       = Romexchange::VERSION
  spec.authors       = ["Chris Odlaug"]
  spec.email         = ["chrisodlaug@gmail.com"]

  spec.summary       = %q{Simple SDK for querying romexchange.com}
  spec.description   = %q{Same}
  spec.homepage      = "https://github.com/codlaug/romexchange"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "rubygems'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "github."
  spec.metadata["changelog_uri"] = "github CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 0.15.4"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
