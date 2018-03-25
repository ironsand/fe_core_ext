require 'uri'

module FeCoreExt::CoreExt
end

module FeCoreExt::CoreExt::URI
  def download(file)
    File.open(file, 'wb') {|f| f.write(open(self).read)}
  end
end

module FeCoreExt::CoreExt::URIClassMethods
end

class URI
  extend FeCoreExt::CoreExt::URIClassMethods
  include FeCoreExt::CoreExt::URI
end