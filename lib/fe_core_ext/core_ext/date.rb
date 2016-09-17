require 'active_support'
require 'active_support/time'

module FeCoreExt::CoreExt
end

module FeCoreExt::CoreExt::Date
  def parse_as_future(string)
    date = parse(string)
    date > current ? date : date + 1.year
  end
end

class Date
  extend FeCoreExt::CoreExt::Date
end
