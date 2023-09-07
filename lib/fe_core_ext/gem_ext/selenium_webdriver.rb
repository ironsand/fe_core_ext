module Selenium::WebDriver::Find
  def find_element_without_no_element_error(*args)
    find_element(*args)
  rescue Selenium::WebDriver::Error::NoSuchElementError
    nil
  end

  def find_elements_without_no_element_error(*args)
    find_elements(*args)
  rescue Selenium::WebDriver::Error::NoSuchElementError
    nil
  end

  def at_xpath(path, wait: nil)
    if wait.present?
      driver_wait = Selenium::WebDriver::Wait.new(timeout: wait)
      driver_wait.until { find_element_without_no_element_error(:xpath, path) }
    end
    find_element_without_no_element_error(:xpath, path)
  end

  def xpath(path, wait: nil)
    if wait.present?
      driver_wait = Selenium::WebDriver::Wait.new(timeout: wait)
      driver_wait.until { find_elements_without_no_element_error(:xpath, path) }
    end
    find_elements_without_no_element_error(:xpath, path)
  end

  def at_css(path, wait: nil)
    if wait.present?
      driver_wait = Selenium::WebDriver::Wait.new(timeout: wait)
      driver_wait.until { find_element_without_no_element_error(:css, path) }
    end
    find_element_without_no_element_error(:css, path)
  end

  def css(path, wait: nil)
    if wait.present?
      driver_wait = Selenium::WebDriver::Wait.new(timeout: wait)
      driver_wait.until { find_elements_without_no_element_error(:css, path) }
    end
    find_elements_without_no_element_error(:css, path)
  end
end

class Selenium::WebDriver::Driver
  include Selenium::WebDriver::Find
end

class Selenium::WebDriver::Element
  include Selenium::WebDriver::Find
end
