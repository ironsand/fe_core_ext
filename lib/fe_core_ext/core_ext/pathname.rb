# frozen_string_literal: true

require "pathname"
require "yaml"
require "fileutils"

module FeCoreExt
  module CoreExt
    module Pathname
      def load_yaml
        return unless exist?
        YAML.load_file(self)
      end

      def glob(pattern, &block)
        Pathname.glob(join(pattern), &block)
      end

      def existence
        self if exist?
      end

      def touch(options = {})
        FileUtils.touch(@path, options)
      end

      def rm(options = {})
        FileUtils.rm(self, options)
      end

      def mkdir_p
        mkpath
        self
      end

      def copy(dest)
        FileUtils.cp(self, dest)
      end

      def require_relative
        Kernel.require_relative(self)
      end
    end
  end
end

module FeCoreExt
  module CoreExt
    module PathnameClassMethods
      def join(*args)
        new(File.join(*args))
      end

      def mktmpdir(prefix_suffix = nil, tmpdir = nil)
        if block_given?
          Dir.mktmpdir prefix_suffix, tmpdir do |dir|
            yield new(dir)
          end
        else
          new(Dir.mktmpdir(prefix_suffix, tmpdir))
        end
      end
    end
  end
end

class Pathname
  extend FeCoreExt::CoreExt::PathnameClassMethods
  include FeCoreExt::CoreExt::Pathname
end
