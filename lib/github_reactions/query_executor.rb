# frozen_string_literal: true

require 'terminal-table'
require 'github_reactions/visualizer'
require 'github_reactions/graphql/client'

module GithubReactions
  class QueryExecutor
    class << self
      def get(repository_name)
        reaction_groups = []

        after = nil

        0.step do |i|
          result = GraphQL::Client.query(
            GraphQL::Client::ReactionQuery,
            {
                q: "repo:#{repository_name}",
                after: after,
            })

          puts "Fetched #{GraphQL::Client::BATCH_SIZE * i + result.data.search.nodes.size} / #{result.data.search.issue_count}... #{Visualizer::EMOJI_UNICORD_MAP.values.sample}"

          result.data.search.nodes.each do |node|
            reaction_groups << node.reaction_groups
          end

          if result.data.search.page_info.has_next_page
            after = result.data.search.page_info.end_cursor
          else
            break
          end
        end

        reaction_groups
      end
    end
  end
end
