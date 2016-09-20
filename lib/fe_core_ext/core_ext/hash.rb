require 'active_support'
require 'active_support/core_ext/hash'

module FeCoreExt::CoreExt
end

module FeCoreExt::CoreExt::Hash
  def clean
    reject { |_, value| value.nil? || value.blank? }
  end
end

class Hash
  include FeCoreExt::CoreExt::Hash
end
