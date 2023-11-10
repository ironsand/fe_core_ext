# frozen_string_literal: true

require "active_support"
require "active_support/time"

module FeCoreExt
  module CoreExt
    module DateMethods
      def end_of_month?
        self == end_of_month
      end

      def range(duration)
        Range.new(*[self + duration, self].minmax)
      end

      def to_time_range
        Range.new(beginning_of_day, end_of_day)
      end

      def nth_weekday(nth, weekday)
        first_day = Date.new(year, month, 1)
        weekdays_hash = { sun: 0, mon: 1, tue: 2, wed: 3, thu: 4, fri: 5, sat: 6 }
        weekday_dates = (first_day..first_day.end_of_month).select { |d| d.wday == weekdays_hash[weekday] }
        weekday_dates[nth - 1]
      end
    end
  end
end

module FeCoreExt
  module CoreExt
    module DateClassMethods
      def parsable?(string)
        parsed_hash = _parse(string)
        return true if parsed_hash.has_key?(:year) && parsed_hash.has_key?(:mon)

        false
      end

      def parse_as_future(string)
        date = parse(string)
        date > current ? date : date + 1.year
      end

      def parse_heisei(string)
        string.match('平成(\d+)年(\d+)月(\d+)日') do
          Date.new(::Regexp.last_match(1).to_i + 1988, ::Regexp.last_match(2).to_i, ::Regexp.last_match(3).to_i)
        end
      end

      def parse_reiwa(string)
        string.match('令和(\S+)年(\d+)月(\d+)日') do
          year = 1 if ::Regexp.last_match(1) == "元"
          year ||= ::Regexp.last_match(1).to_i
          Date.new(year + 2018, ::Regexp.last_match(2).to_i, ::Regexp.last_match(3).to_i)
        end
      end

      def parse_gengo(string)
        parse_heisei(string) || parse_reiwa(string)
      end

      def parse_nengappi(string)
        string.match(/(\d{4})年(\d+)月(\d+)日/) do
          Date.new(::Regexp.last_match(1).to_i, ::Regexp.last_match(2).to_i, ::Regexp.last_match(3).to_i)
        end
      end

      def parse_ja(string)
        parse_nengappi(string) || parse_gengo(string)
      end
    end
  end
end

class Date
  include FeCoreExt::CoreExt::DateMethods
  extend FeCoreExt::CoreExt::DateClassMethods
end
