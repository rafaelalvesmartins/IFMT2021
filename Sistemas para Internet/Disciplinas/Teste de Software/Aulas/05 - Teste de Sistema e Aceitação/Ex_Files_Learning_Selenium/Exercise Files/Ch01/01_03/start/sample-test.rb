require "selenium-webdriver"

driver = Selenium::WebDriver.for :firefox
driver.navigate.to "http://google.com"

element = driver.find_element(name: 'q')
element.click
element.send_keys "Hello WebDriver!"
element.submit

driver.quit
