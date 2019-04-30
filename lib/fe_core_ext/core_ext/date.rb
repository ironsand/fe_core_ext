require 'active_support'
require 'active_support/time'

module FeCoreExt::CoreExt
end

module FeCoreExt::CoreExt::Date
  def end_of_month?
    self == end_of_month
  end

  def range(duration)
    Range.new(*[self + duration, self].minmax)
  end

  def to_time_range
    Range.new(beginning_of_day, end_of_day)
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

  def parse_reiwa(string)
    string.match('令和(\S+)年(\d+)月(\d+)日') {
      year = 1 if $1 == '元'
      year ||= $1.to_i
      Date.new(year + 2018, $2.to_i, $3.to_i)
    }
  end

  def parse_gengo(string)
    parse_heisei(string) || parse_reiwa(string)
  end
end

class Date
  include FeCoreExt::CoreExt::Date
  extend FeCoreExt::CoreExt::DateClassMethods
end
