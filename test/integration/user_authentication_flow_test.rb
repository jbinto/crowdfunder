require 'test_helper'

class UserAuthenticationFlowTest < ActionDispatch::IntegrationTest
  test "successful registration" do
    # Visit new user page
    visit '/users/new'
    assert_equal new_user_path, current_path

    # There should be a "sign up" link in the nav
    assert find('.navbar').has_link?('Sign Up')

    # Fill in the form
    user = FactoryGirl.build(:user)
    
    fill_in 'user[full_name]', with: user.full_name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password

    # Try to create an account, should redirect user to root
    click_button 'Create account'
    assert_equal current_path, root_path

    # There should be a "logout" link in the nav
    assert find('.navbar').has_link?('Log out')
  end

  test "failed registration" do

  end
end
