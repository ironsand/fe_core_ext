# frozen_string_literal: true

require "bigdecimal"
require "bigdecimal/util"
require "pathname"
require "nkf"

module FeCoreExt
  module CoreExt
    module String
      def to_integer
        return unless valid_number?
        delete(",").to_i
      end

      def integer?
        to_integer.to_s == delete(",")
      end

      def to_decimal
        return unless valid_number?
        delete(",").to_d
      end

      def to_decimal_new
        return unless valid_number?
        delete(",").to_d
      end

      def to_float
        return unless valid_number?
        delete(",").to_f
      end

      def valid_sec_code?
        valid_chars = "[0-9ACDFGHJKLMNPRSTUWXY]"
        match?(/^\d#{valid_chars}\d#{valid_chars}$/)
      end

      def to_pathname
        Pathname(self)
      end

      def not_number?
        to_i.zero? && match("0").nil?
      end

      def valid_number?
        match?(/^-?([0-9][\d,.]*)$/)
      end

      ## deprecated
      def zen_to_han
        tr("０-９Ａ-Ｚａ-ｚ　＆・－（）", '0-9A-Za-z &･\-()')
      end

      def alphanumeric_zen_to_han
        tr("０-９Ａ-Ｚａ-ｚ　＆・．－（）", '0-9A-Za-z &･.\-()')
      end

      def to_katakana
        tr("ぁ-ん", "ァ-ン")
      end

      def match?(str)
        /#{str}/ === self
      end

      def kana_upcase
        tr("ァィゥェォヵヶッャュョヮ", "アイウエオカケツヤユヨワ")
      end

      def to_han_kana
        return if self.nil?
        NKF.nkf("-wxZ4", self)
      end

      def to_zen_kana
        return if self.nil?
        NKF.nkf("-wX", self)
      end

      def to_date_in_ja
        to_date_in_ja_seireki || to_date_in_ja_heisei
      end

      def to_date_in_ja_seireki
        match(/(\d{4})年(\d{1,2})月(\d{1,2})日/) { Date.new($1.to_i, $2.to_i, $3.to_i) }
      end

      def to_date_in_ja_heisei
        match(/平成(\d{2})年(\d{1,2})月(\d{1,2})日/) { Date.new($1.to_i + 1988, $2.to_i, $3.to_i) }
      end

      # remove also no break space and other space like characters.
      def strong_strip
        reverse.gsub(/^\p{Zs}+|^\p{Cf}+/, "").reverse.gsub(/^\p{Zs}+|^\p{Cf}+/, "")
      end

      def sjis_encodable
        tr("\u301C\u2212\u00A2\u00A3\u00AC\u2014\u2016",
           "\uFF5E\uFF0D\uFFE0\uFFE1\uFFE2\u2015\u2225")
      end

      def eucjp_encodable
        tr("\uFF5E\uFF0D\uFFE0\uFFE1\uFFE2\u2015\u2225",
           "\u301C\u2212\u00A2\u00A3\u00AC\u2014\u2016")
      end
    end
  end
end

class String
  include FeCoreExt::CoreExt::String
end
