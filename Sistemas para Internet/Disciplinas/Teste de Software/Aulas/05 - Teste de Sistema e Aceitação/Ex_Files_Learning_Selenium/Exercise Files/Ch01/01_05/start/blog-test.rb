require "selenium-webdriver"

# TEST: sign up for blog
driver = Selenium::WebDriver.for :firefox
# Go to signup form
driver.navigate.to "https://selenium-blog.herokuapp.com/signup"

# Fill out and submit form
username_field = driver.find_element(id: 'user_username')
username_field.send_keys("user")

email_field = driver.find_element(id: 'user_email')
email_field.send_keys("user@test.com")

password_field = driver.find_element(id: 'user_password')
password_field.send_keys("password")

sign_up_button = driver.find_element(id: 'submit')
sign_up_button.click

# Confirm user is signed up successfully

driver.quit
