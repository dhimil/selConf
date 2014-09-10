require 'rubygems'
require 'selenium-webdriver'

caps = Selenium::WebDriver::Remote::Capabilities.new
caps["platformName"] = :IOS
caps["deviceName"] = "ipad"
caps["app"] = "safari"
caps[:browser_name] = "safari"
puts caps.inspect

driver = Selenium::WebDriver.for(:remote,
  :url => "http://localhost:4567/wd/hub",
  :desired_capabilities => caps)

driver.get "http://www.google.com/ncr"
sleep 2
element = driver.find_element(:name, 'q')
element.send_keys "Dhimil"
element.submit
puts driver.title
sleep 2
driver.quit
