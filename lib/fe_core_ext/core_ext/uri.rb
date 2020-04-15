require 'uri'
require 'open-uri'
require 'net/http'

module FeCoreExt::CoreExt
end

module URI
  def download(file)
    binary = OpenURI.open_uri(self).read
    File.open(file, 'wb') {|f| f.write(binary)}
  end

  def exists?
    req = Net::HTTP.new(host, port)
    req.use_ssl = true if scheme == 'https'
    res = req.request_head(path)
    return URI(res['location']).exists? if %w(301 302).include?(res.code)
    res.code == '200'
  end
end

class URI::Generic
  def basename
    ::File.basename(path)
  end
end
