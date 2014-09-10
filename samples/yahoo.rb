# A small example where JS click does not work. This test needs native click

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

driver.get "https://celebrity.yahoo.com/video/candace-cameron-bures-dwts-aches-225000203.html"
element = driver.find_element(:class, 'yui3-videoplayer-startscreen-button')
puts "Huston we have the URL going for the click"
# Click is not native. Huston will crash
element.click
puts driver.title
sleep 10
driver.quit
