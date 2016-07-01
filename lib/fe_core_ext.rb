require 'fe_core_ext/version'
#require 'fe_core_ext/core_ext/array.rb'
Dir["#{File.dirname(__FILE__)}/core_ext/*.rb"].each do |path|
  require path
end

module FeCoreExt
   # Your code goes here...
end
