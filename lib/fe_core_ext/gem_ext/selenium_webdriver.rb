class Selenium::WebDriver::Driver
  def fe_find_element(*args)
    find_element(*args)
  rescue Selenium::WebDriver::Error::NoSuchElementError
    nil
  end

  def fe_find_elements(*args)
    find_elements(*args)
  rescue Selenium::WebDriver::Error::NoSuchElementError
    nil
  end

  def at_xpath(path, wait: nil)
    if wait.present?
      driver_wait = Selenium::WebDriver::Wait.new(timeout: wait)
      driver_wait.until { fe_find_element(:xpath, path) }
    end
    fe_find_element(:xpath, path)
  end

  def xpath(path, wait: nil)
    if wait.present?
      driver_wait = Selenium::WebDriver::Wait.new(timeout: wait)
      driver_wait.until { fe_find_elements(:xpath, path) }
    end
    fe_find_elements(:xpath, path)
  end

  def at_css(path, wait: nil)
    if wait.present?
      driver_wait = Selenium::WebDriver::Wait.new(timeout: wait)
      driver_wait.until { fe_find_element(:css, path) }
    end
    fe_find_element(:css, path)
  end

  def css(path, wait: nil)
    if wait.present?
      driver_wait = Selenium::WebDriver::Wait.new(timeout: wait)
      driver_wait.until { fe_find_elements(:css, path) }
    end
    fe_find_elements(:css, path)
  end
end