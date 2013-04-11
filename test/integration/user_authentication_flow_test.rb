require 'test_helper'

class UserAuthenticationFlowTest < ActionDispatch::IntegrationTest
  test "successful registration" do
    # Visit new user page
    visit '/users/new'
    assert_equal new_user_path, current_path

    # There should be a "sign up" link in the nav
    assert_not_signed_in

    # Fill in the form
    user = FactoryGirl.build(:user)
    
    fill_in 'user[full_name]', with: user.full_name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password

    # Try to create an account, should redirect user to root with a flash message
    click_button 'Create account'
    assert_equal current_path, root_path
    assert page.has_content?('Account created')

    # There should be a "logout" link in the nav
    assert_signed_in
  end

  test "failed registration" do
    # Visit new user page
    visit '/users/new'
    assert_equal new_user_path, current_path

    # With only one field filled in, try to create account
    user = FactoryGirl.build(:user)
    fill_in 'user[email]', with: user.email
    click_button 'Create account'

    # Should still be on the users create page with no flash message
    assert_equal users_path, current_path
    assert page.has_no_content?('Account created')

    # Should show some errors
    assert find('.alert:first').has_content?('Try again')
  end

  test "successful log in" do
    setup_logged_in_user
    
    # Ensure we are signed in
    visit '/'
    assert_signed_in
  end

  test "failed log in" do
    visit '/'
    click_link 'Sign in'

    fill_in "email", with: "xxxx"
    fill_in "password", with: "xxxx"
    click_button 'Login'

    assert_equal current_path, sign_in_path
    assert find('.alert:first').has_content?('Try again')
  end

  test "successful log out" do
    Capybara.current_driver = Capybara.javascript_driver

    setup_logged_in_user

    visit '/projects'

    click_link 'Log out'

    visit '/'
    assert_not_signed_in

  end

  def assert_signed_in
    assert find('.navbar').has_link?('Log out')
    assert find('.navbar').has_no_link?('Sign up')
  end

  def assert_not_signed_in
    assert find('.navbar').has_no_link?('Log out')
    assert find('.navbar').has_link?('Sign up')
  end


end
