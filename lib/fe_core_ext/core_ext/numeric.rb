# frozen_string_literal: true

module FeCoreExt::CoreExt
end

module FeCoreExt::CoreExt::Numeric
  def invert
    -self
  end
end

class Numeric
  include FeCoreExt::CoreExt::Numeric
end