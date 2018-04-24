# frozen_string_literal: true

require "graphql/client"
require "graphql/client/http"

module GithubReactions
  module GraphQL
    module Client
      HTTP = ::GraphQL::Client::HTTP.new('https://api.github.com/graphql') do
        def headers(context)
          {
              "Authorization" => "Bearer #{ENV['ACCESS_TOKEN']}"
          }
        end
      end

      Schema = ::GraphQL::Client.load_schema(HTTP)

      Client = ::GraphQL::Client.new(schema: Schema, execute: HTTP)

      ReactionQuery = Client.parse <<-'GRAPHQL'
        query($q: String!, $after: String, $batch_size: Int) {
          search(first: $batch_size, query: $q, type: ISSUE, after: $after) {
            issueCount,
            pageInfo {
              endCursor,
              hasNextPage,
            },
            nodes {
              ... on Issue {
                reactionGroups {
                  content,
                  users {
                    totalCount
                  }
                }
              },
              ... on PullRequest {
                reactionGroups {
                  content,
                  users {
                    totalCount
                  }
                }
              }
            }
          }
        }
      GRAPHQL

      BATCH_SIZE = 100

      DEFAULT_VARIABLES = {
        batch_size: BATCH_SIZE
      }.freeze

      def self.query(query, variables)
        Client.query(query, variables: DEFAULT_VARIABLES.merge(variables))
      end
    end
  end
end
