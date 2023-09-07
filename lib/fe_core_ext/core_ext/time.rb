# frozen_string_literal: true

require "active_support"
require "active_support/time"

module FeCoreExt::CoreExt
end

module FeCoreExt::CoreExt::Time
  def floor(unit = :sec)
    case unit
    when :sec
      Time.zone.local(year, month, day, hour, min, sec)
    else
      self
    end
  end
end

module FeCoreExt::CoreExt::TimeClassMethods
end

class Time
  include FeCoreExt::CoreExt::Time
  extend FeCoreExt::CoreExt::TimeClassMethods
end
