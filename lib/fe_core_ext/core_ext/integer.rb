module FeCoreExt::CoreExt
end

module FeCoreExt::CoreExt::Integer
  def nan?
    false
  end
end

class Fixnum
  include FeCoreExt::CoreExt::Integer
end
