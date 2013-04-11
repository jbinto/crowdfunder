require 'test_helper'

class PledgeFlowsTest < ActionDispatch::IntegrationTest
  test "unauthenticated users backing a project are asked to sign in" do    
    # Make a single dummy project
    project = FactoryGirl.create(:project)

    # Go to the project#show page
    visit '/projects'
    click_link 'Wifi enabled shoes'
    assert_equal project_path(project), current_path
    
    # Try to back the project without being signed in
    click_link 'Back this project'
    assert_equal sign_in_path, current_path

  end

end
