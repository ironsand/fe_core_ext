require 'active_support'
require 'active_support/core_ext/hash'

module FeCoreExt::CoreExt
end

module FeCoreExt::CoreExt::Hash
  def symbolize_keys
    transform_keys { |key| key.to_s.underscore.to_sym }
  end
end

class Hash
  include FeCoreExt::CoreExt::Hash
end
