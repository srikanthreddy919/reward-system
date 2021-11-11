module Rewards
  class Main
    attr_reader :data, :validator, :errors, :calculator

    delegate :errors, :invalid?, to: :validator
    delegate :calculate, to: :calculator

    def initialize(data)
      @data = data
      @validator = Validators::Input.new(data)
      @formatter = Formatter.new(data)
      rows = @formatter.sorted_rows
      @calculator = Rewards::Calculator.new(rows)
    end
  end
end
