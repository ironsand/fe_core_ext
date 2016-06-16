module FeCoreExt::CoreExt
end

module FeCoreExt::CoreExt::String
  def to_integer
    return if not_number?
    delete(',').to_i
  end

  def to_decimal
    return if not_number?
    delete(',').to_d
  end

  def not_number?
    to_i == 0 && match('0').nil?
  end
end

class String
  include FeCoreExt::CoreExt::String
end
