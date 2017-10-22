require 'bigdecimal'
require 'bigdecimal/util'
require 'pathname'

module FeCoreExt::CoreExt
end

module FeCoreExt::CoreExt::String
  def to_integer
    return if not_number?
    delete(',').to_i
  end

  def to_decimal
    return if not_number?
    delete(',').to_d
  end

  def to_pathname
    Pathname(self)
  end

  def not_number?
    to_i == 0 && match('0').nil?
  end

  def zen_to_han
    tr('０-９Ａ-Ｚａ-ｚ　＆・－（）', '0-9A-Za-z &･\-()')
  end

  def to_katakana
    tr('ぁ-ん', 'ァ-ン')
  end

  def match?(str)
    /#{str}/ === self
  end

  def kana_upcase
    tr('ァィゥェォヵヶッャュョヮ','アイウエオカケツヤユヨワ')
  end

  def to_han_kana
    return if self.nil?
    NKF.nkf('-wxZ4', self)
  end

  def to_zen_kana
    return if self.nil?
    NKF.nkf('-wX',self)
  end

  def to_date_in_ja
    match(/(\d{4})年(\d{1,2})月(\d{1,2})日/){ Date.new($1.to_i, $2.to_i, $3.to_i) }
  end
end

class String
  include FeCoreExt::CoreExt::String
end
