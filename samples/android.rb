require 'rubygems'
require 'selenium-webdriver'

caps = Selenium::WebDriver::Remote::Capabilities.android
caps["platformName"] = :ANDROID
caps["browserName"] = "chrome"
caps["deviceName"] = "android"

driver = Selenium::WebDriver.for(:remote,
  :url => "http://localhost:4444/wd/hub",
  :desired_capabilities => caps)

driver.get "http://www.google.com/ncr"
sleep 2
element = driver.find_element(:name, 'q')
element.send_keys "Dhimil"
element.submit
puts driver.title
driver.save_screenshot "a.png"
sleep 2
driver.quit
