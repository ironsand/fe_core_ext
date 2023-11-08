# frozen_string_literal: true

module FeCoreExt
  module CoreExt
    module Integer
      def nan?
        false
      end
    end
  end
end

class Integer
  include FeCoreExt::CoreExt::Integer
end
