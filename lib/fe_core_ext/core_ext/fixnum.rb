module FeCoreExt::CoreExt
end

module FeCoreExt::CoreExt::Fixnum
  def nan?
    false
  end
end

class Fixnum
  include FeCoreExt::CoreExt::Fixnum
end
