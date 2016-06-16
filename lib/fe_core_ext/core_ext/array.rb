module FeCoreExt::CoreExt
end

module FeCoreExt::CoreExt::Array
  def median
    return if empty?
    sorted = sort
    len = sorted.length
    (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
  end
end

class Array
  include FeCoreExt::CoreExt::Array
end
