module Rewards
  class Calculator
    attr_reader :items

    def initialize(items)
      @items = items
    end

    def calculate
      build_tree
      tree.points.reject { |_k, v| v.zero? }
    end

    private

    def build_tree
      items.each do |item|
        if item.accepts?
          tree.update_reward_options(item.from, accepts: true)
        else
          tree.add_reward_node(item.from, item.to, from: item.from, date: item.date)
        end
      end
    end

    def tree
      @tree ||= Tree.new("Rewards")
    end
  end
end
