# frozen_string_literal: true

require "forwardable"

module Ferrum
  class Browser
    extend Forwardable
    instance_delegate %i[wait_for_css wait_for_csses wait_for_xpath wait_for_xpaths] => :page
  end

  class Page
    extend Forwardable
    instance_delegate %i[wait_for_css wait_for_csses wait_for_xpath wait_for_xpaths] => :main_frame
  end

  class Frame
    module DOM
      def wait_for_csses(selector, timeout: 3)
        wait_for_selector(selector, :css, timeout)
      end

      def wait_for_xpaths(selector, timeout: 3)
        wait_for_selector(selector, :xpath, timeout)
      end

      def wait_for_css(selector, timeout: 3)
        wait_for_selector(selector, :at_css, timeout)
      end

      def wait_for_xpath(selector, timeout: 3)
        wait_for_selector(selector, :at_xpath, timeout)
      end

      private

      def wait_for_selector(selector, selector_method, timeout)
        interval = 0.1
        (timeout / interval).to_i.times do
          nodes = select_ignore_not_found(selector_method, selector)
          next sleep(interval) if nodes.nil? || nodes == []
          return nodes
        end
        nil
      end

      def select_ignore_not_found(selector_method, selector)
        send(selector_method, selector)
      rescue Ferrum::NodeNotFoundError
        nil
      end
    end
  end
end
