require "selenium-webdriver"
require "rspec"

timestamp = Time.now.to_i
username = "user #{timestamp}"
email = "user#{timestamp}@test.com"
password = "password"
expected_banner_text = "Welcome to the alpha blog user #{timestamp}"

def enter_username(username)
  username_field = @driver.find_element(id: 'user_username')
  username_field.send_keys(username)
end

def enter_email_address(email)
  email_field = @driver.find_element(id: 'user_email')
  email_field.send_keys(email)
end

def enter_password(password)
  password_field = @driver.find_element(id: 'user_password')
  password_field.send_keys(password)
end

def submit_form()
  sign_up_button = @driver.find_element(id: 'submit')
  sign_up_button.click
end

def get_banner_text()
  banner = @driver.find_element(id: 'flash_success')
  banner.text
end

# TEST: sign up for blog
describe "Blog application" do
  describe "when signing up a new user"	do
  	 it "creates a new user account successfully" do
		    # Go to signup form
        @driver = Selenium::WebDriver.for :firefox
        @driver.navigate.to "https://selenium-blog.herokuapp.com/signup"
		    # Fill out and submit form
        enter_username(username)
        enter_email_address(email)
        enter_password(password)
        submit_form()
		    # Confirm user is signed up successfully
        banner_text = get_banner_text()
        expect(banner_text).to eq(expected_banner_text)
		    @driver.quit
	   end
  end
end
