require 'rubygems'
require 'selenium-webdriver'

caps = Selenium::WebDriver::Remote::Capabilities.new
caps["platformName"] = :IOS
caps["deviceName"] = "ipad"
caps["app"] = "safari"
caps[:browser_name] = "safari"
puts caps.inspect

driver = Selenium::WebDriver.for(:remote,
  :url => "http://localhost:5555/wd/hub",
  :desired_capabilities => caps)

driver.get "http://172.16.16.16"
sleep 2
element1 = driver.find_element(:name, 'username')
element1.send_keys "129"

element2 = driver.find_element(:name, 'password')
element2.send_keys "NotSure"

# element2.submit
sleep 5
puts driver.title
driver.quit
