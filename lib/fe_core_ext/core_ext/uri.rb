require 'uri'
require 'open-uri'

module FeCoreExt::CoreExt
end

module URI
  def download(file)
    File.open(file, 'wb') {|f| f.write(OpenURI.open_uri(self).read)}
  end
end