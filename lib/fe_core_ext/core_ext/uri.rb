require 'uri'
require 'open-uri'

module FeCoreExt::CoreExt
end

module URI
  def download(file)
    binary = OpenURI.open_uri(self).read
    File.open(file, 'wb') {|f| f.write(binary)}
  end
end