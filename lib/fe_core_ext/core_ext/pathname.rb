require 'pathname'
require 'yaml'

module FeCoreExt::CoreExt
end

module FeCoreExt::CoreExt::Pathname
  def load_yaml
    return unless exist?
    YAML.load_file(self)
  end

  def glob(string)
    Pathname.glob(self.join(string).to_s)
  end
end

module FeCoreExt::CoreExt::PathnameClassMethods
  def join(*args)
    new(File.join(*args))
  end
end

class Pathname
  extend FeCoreExt::CoreExt::PathnameClassMethods
  include FeCoreExt::CoreExt::Pathname
end