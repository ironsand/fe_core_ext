require 'pathname'
require 'yaml'
require 'fileutils'

module FeCoreExt::CoreExt
end

module FeCoreExt::CoreExt::Pathname
  def load_yaml
    return unless exist?
    YAML.load_file(self)
  end

  def glob(pattern, &block)
    Pathname.glob(join(pattern), &block)
  end

  def touch(options={})
    FileUtils.touch(@path, options)
  end

  def delete(options={})
    super if options.empty?
    FileUtils.rm(self, options)
  end

  def mkpath
    super
    self
  end

  def require_relative
    Kernel.require_relative(self)
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