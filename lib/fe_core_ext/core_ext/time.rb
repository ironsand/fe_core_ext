# frozen_string_literal: true

require "active_support"
require "active_support/time"

module FeCoreExt
  module CoreExt
    module Time
      def floor(unit = :sec)
        case unit
        when :sec
          Time.zone.local(year, month, day, hour, min, sec)
        else
          self
        end
      end
    end
  end
end

class Time
  include FeCoreExt::CoreExt::Time
end