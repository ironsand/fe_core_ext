require 'fe_core_ext/version'
# require 'fe_core_ext/core_ext/array'
# require 'fe_core_ext/core_ext/string'
# require 'fe_core_ext/core_ext/hash'
# require 'fe_core_ext/core_ext/csv'
# require 'fe_core_ext/core_ext/pathname'
# require 'fe_core_ext/core_ext/date'
# require 'fe_core_ext/core_ext/integer'
# require 'fe_core_ext/core_ext/numeric'
# require 'fe_core_ext/core_ext/uri'
require 'fe_core_ext/core_ext/time'
Dir.glob('fe_core_ext/core_ext/*.rb').each{|file| require file }

module FeCoreExt
end
