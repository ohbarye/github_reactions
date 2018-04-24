# frozen_string_literal: true

require 'thor'

module GithubReactions
  class CLI < Thor
    class_option :help, type: :boolean, aliases: '-h', desc: 'Show help message.'
    class_option :version, type: :boolean, aliases: '-v', desc: 'Show current version'

    desc "get", "Get reactions in a specified repository"
    def get(repository_name)
      puts repository_name
    end

    desc "version", "Show current version"
    def version
      puts GithubReactions::VERSION
    end
  end
end
