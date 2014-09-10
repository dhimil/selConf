require 'rubygems'
require 'selenium-webdriver'

caps = Selenium::WebDriver::Remote::Capabilities.android

driver = Selenium::WebDriver.for(:remote,
  :url => "http://localhost:5555/wd/hub",
  :desired_capabilities => caps)
begin
driver.get "http://www.google.com/ncr"
element = driver.find_element(:name, 'q')
element.send_keys "Dhimil"
element.submit
puts driver.title
driver.save_screenshot "a.png"
ensure
driver.quit
end
