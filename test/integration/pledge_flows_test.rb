require 'test_helper'

class PledgeFlowsTest < ActionDispatch::IntegrationTest
  test "unauthenticated users backing a project are asked to sign in" do    
    project = goto_project
    
    # Try to back the project without being signed in
    click_link 'Back this project'
    assert_equal sign_in_path, current_path
  end

  test "authenticated user can make a pledge" do
    setup_logged_in_user
    project = goto_project

    # Back the project    
    click_link 'Back this project'
    assert_equal new_project_pledge_path(project), current_path

    # Make a pledge
    fill_in "pledge[amount]", :with => 500
    click_button "Make your pledge"

    # User should be redirected back to root with a message
    assert_equal root_path, current_path
    assert find('.alert:first').has_content?("Thanks for pledging")
  end

  def goto_project
    # Make a single dummy project
    project = FactoryGirl.create(:project)

    # Go to the project#show page
    visit '/projects'
    click_link 'Wifi enabled shoes'
    assert_equal project_path(project), current_path

    project
  end

end
