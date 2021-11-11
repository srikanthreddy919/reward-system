module Rewards
  module Normalizer
    module_function

    DATE_FORMAT_LENGTH = 16

    def date(row)
      strtime = row.strip.first(DATE_FORMAT_LENGTH)
      Time.zone.parse(strtime)
    end
  end
end
