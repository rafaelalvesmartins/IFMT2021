class SignupPage

  # css selectors
  USERNAME_FIELD = { id: 'user_username' }
  EMAIL_FILED = { id: 'user_email' }
  PASSWORD_FIELD = { id: 'user_password' }
  SUBMIT_BUTTON = { id: 'submit' }

  attr_reader :driver

  # class methods
  def initialize(driver)
    @driver = driver
  end

  def enter_username(username)
    username_field = @driver.find_element(USERNAME_FIELD)
    username_field.send_keys(username)
  end

  def enter_email_address(email)
    email_field = @driver.find_element(EMAIL_FILED)
    email_field.send_keys(email)
  end

  def enter_password(password)
    password_field = @driver.find_element(PASSWORD_FIELD)
    password_field.send_keys(password)
  end

  def submit_form()
    sign_up_button = @driver.find_element(SUBMIT_BUTTON)
    sign_up_button.click
  end

end
