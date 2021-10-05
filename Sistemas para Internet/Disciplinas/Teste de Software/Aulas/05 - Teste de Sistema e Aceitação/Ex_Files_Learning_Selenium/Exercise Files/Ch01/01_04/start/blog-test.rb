require "selenium-webdriver"

# TEST: Sign up for blog
driver = Selenium::WebDriver.for :firefox
driver.navigate.to "https://selenium-blog.herokuapp.com/signup"

driver.quit