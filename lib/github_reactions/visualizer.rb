# frozen_string_literal: true

require "terminal-table"

module GithubReactions
  class Visualizer
    attr_reader :repository_name, :reaction_groups

    EMOJI_UNICORD_MAP = {
        "THUMBS_UP" => "\u{1F44D}",
        "THUMBS_DOWN" => "\u{1F44E}",
        "LAUGH" => "\u{1F604}",
        "HOORAY" => "\u{1F389}",
        "CONFUSED" => "\u{1F615}",
        "HEART" => "\u{2764}",
    }.freeze

    class << self
      def visualize(repository_name, reaction_groups)
        new(repository_name, reaction_groups).visualize
      end
    end

    def initialize(repository_name, reaction_groups)
      @repository_name = repository_name
      @reaction_groups = reaction_groups
    end

    def visualize
      title = "#{repository_name} has #{count_grouped_by_reaction.values.reduce(:+)} reactions so far"

      table = Terminal::Table.new(
        title: title,
        headings: ['Emoji', 'Count'],
        rows: count_grouped_by_reaction.map(&:to_a),
      )

      table.align_column(1, :right)

      puts table
    end

    private

    def count_grouped_by_reaction
      @_count_grouped_by_reaction ||= reaction_groups.reduce(Hash.new(0)) do |memo, reaction_group|
        reaction_group.each do |reaction|
          next if reaction.users.total_count.zero?
          memo[reaction.content] += reaction.users.total_count
        end
        memo
      end
    end
  end
end
