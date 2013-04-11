ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting

  # Add more helper methods to be used by all tests here...

  class ActionDispatch::IntegrationTest
    include Capybara::DSL
    Capybara.app = CrowdfunderInClass::Application

    # Boilerplate ahead
    DatabaseCleaner.strategy = :truncation
    Capybara.javascript_driver = :webkit
    self.use_transactional_fixtures = false

    teardown do
      DatabaseCleaner.clean       # truncate database
      Capybara.reset_session!     # forget the simulated browser state
      Capybara.use_default_driver # revert from javascript
    end

    def setup_logged_in_user
      # Create a dummy user we can log in as
      password = "mysecretpassword"
      user = FactoryGirl.create(:user, :password => password)

      # Log in as that user
      visit '/'
      click_link 'Sign in'
      fill_in "email", with: user.email
      fill_in "password", with: password
      click_button "Login"

      user
    end

  end

end
