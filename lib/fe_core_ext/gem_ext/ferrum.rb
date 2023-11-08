# frozen_string_literal: true

module Ferrum
  class Browser
    delegate :wait_for_css, :wait_for_xpath, to: :page
  end

  class Page
    delegate :wait_for_css, :wait_for_xpath, to: :main_frame
  end

  class Frame
    module DOM
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
          node = send(selector_method, selector)
          return node if node
          sleep(interval)
        end
        nil
      end
    end
  end
end
