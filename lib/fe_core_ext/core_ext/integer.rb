# frozen_string_literal: true

module FeCoreExt::CoreExt
end

module FeCoreExt::CoreExt::Integer
  def nan?
    false
  end
end

class Integer
  include FeCoreExt::CoreExt::Integer
end
