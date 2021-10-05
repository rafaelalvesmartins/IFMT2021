require "selenium-webdriver"
require "rspec"

timestamp = Time.now.to_i
username = "user#{timestamp}"
email = "user#{timestamp}@test.com"
password = "password"
expected_banner_text = "Welcome to the alpha blog user#{timestamp}"

# TEST: sign up for blog
describe "Blog application" do
  describe "when signing up a new user" do
    it "creates a new user account successfully" do
      driver = Selenium::WebDriver.for :firefox
      # Go to signup form
      driver.navigate.to "https://selenium-blog.herokuapp.com/signup"
      # Fill out and submit form
      username_field = driver.find_element(id: 'user_username')
      username_field.send_keys(username)

      email_field = driver.find_element(id: 'user_email')
      email_field.send_keys(email)

      password_field = driver.find_element(id: 'user_password')
      password_field.send_keys(password)

      sign_up_button = driver.find_element(id: 'submit')
      sign_up_button.click

      # Confirm user is signed up successfully
      banner = driver.find_element(id: 'flash_success')
      banner_text = banner.text
      expect(banner_text).to eq(expected_banner_text) 

      driver.quit
    end
  end
end
