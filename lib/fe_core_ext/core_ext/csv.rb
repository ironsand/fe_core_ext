# frozen_string_literal: true

require "bigdecimal"
require "bigdecimal/util"
require "csv"

class CSV
  Converters[:decimal] = lambda do |field|
    begin
      Float(field)
      field.to_d
    rescue
      field
    end
  end
end
