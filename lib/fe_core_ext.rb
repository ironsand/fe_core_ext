require 'fe_core_ext/version'
Dir.glob("#{Dir.pwd}/lib/fe_core_ext/core_ext/*.rb").each{|file| require file }

module FeCoreExt
end
