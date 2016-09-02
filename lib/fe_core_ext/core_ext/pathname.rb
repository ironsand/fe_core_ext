require 'pathname'
require 'yaml'

module FeCoreExt::CoreExt
end

module FeCoreExt::CoreExt::Pathname
  def load_yaml
    return unless exist?
    YAML.load_file(self)
  end
end

class Pathname
  include FeCoreExt::CoreExt::Pathname
end