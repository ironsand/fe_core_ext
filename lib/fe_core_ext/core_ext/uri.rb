# frozen_string_literal: true

require "uri"
require "fileutils"
require "open-uri"
require "net/http"

module URI
  def download(file)
    warn "URI#downloadの引数にはPathnameを使いましょう！" if file.is_a?(String)
    binary = OpenURI.open_uri(self).read
    file = file + self.basename if file.to_s[-1] == "/"
    dirname = ::File.dirname(file)
    ::FileUtils.mkdir_p(dirname) unless ::File.directory?(dirname)
    ::File.open(file, "wb") { |f| f.write(binary) }
  end

  def exists?
    req = ::Net::HTTP.new(host, port)
    req.use_ssl = true if scheme == "https"
    res = req.request_head(path)
    return URI(res["location"]).exists? if %w(301 302).include?(res.code)
    res.code == "200"
  end
end

module URI
  class Generic
    def basename
      ::File.basename(path)
    end
  end
end
