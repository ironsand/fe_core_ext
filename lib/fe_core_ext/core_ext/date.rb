require 'active_support'
require 'active_support/time'

module FeCoreExt::CoreExt
end

module FeCoreExt::CoreExt::Date
  def end_of_month?
    self == end_of_month
  end
class Date
  def range(duration)
    Range.new(*[(self + duration), self].minmax)
  end
end

module FeCoreExt::CoreExt::DateClassMethods
  def parse_as_future(string)
    date = parse(string)
    date > current ? date : date + 1.year
  end

  def parse_heisei(string)
    string.match('平成(\d+)年(\d+)月(\d+)日') {
      Date.new($1.to_i + 1988, $2.to_i, $3.to_i)
    }
  end
end

class Date
  include FeCoreExt::CoreExt::Date
  extend FeCoreExt::CoreExt::DateClassMethods
end
