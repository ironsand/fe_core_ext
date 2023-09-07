# frozen_string_literal: true

require "active_support"
require "active_support/core_ext/hash"

module FeCoreExt::CoreExt
end

module FeCoreExt::CoreExt::Hash
  def rename_key(original_key, new_key)
    self[new_key] = delete(original_key) if key?(original_key)
    self
  end
end

class Hash
  include FeCoreExt::CoreExt::Hash
end
