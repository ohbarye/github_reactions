
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "github_reactions/version"

Gem::Specification.new do |spec|
  spec.name          = "github_reactions"
  spec.version       = GithubReactions::VERSION
  spec.authors       = ["ohbarye"]
  spec.email         = ["over.rye@gmail.com"]

  spec.summary       = "Simple CLI to summary GitHub reactions in a repository"
  spec.description   = "A simple command line tool to show numbers of reactions on GitHub issues and pull requests."
  spec.homepage      = "https://github.com/ohbarye/github_reactions"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"
  spec.add_dependency "graphql-client"
  spec.add_dependency "terminal-table"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
