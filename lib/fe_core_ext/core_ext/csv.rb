require 'bigdecimal'
require 'bigdecimal/util'
require 'csv'

module FeCoreExt::CoreExt
end

module FeCoreExt::CoreExt::CSV

end

class CSV
  #include FeCoreExt::CoreExt::CSV
  Converters[:decimal] = lambda do |field|
    begin
      Float(field)
      field.to_d
    rescue
      field
    end
  end
end