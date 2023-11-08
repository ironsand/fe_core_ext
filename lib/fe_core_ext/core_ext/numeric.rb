# frozen_string_literal: true

module FeCoreExt
  module CoreExt
    module Numeric
      def invert
        -self
      end
    end
  end
end

class Numeric
  include FeCoreExt::CoreExt::Numeric
end
