require 'test_helper'

class MyProjectFlowsTest < ActionDispatch::IntegrationTest

  test "lists only my projects" do 
    me = setup_logged_in_user
    other_user = FactoryGirl.create(:user)

    3.times { FactoryGirl.create :project, user: me }
    2.times { FactoryGirl.create :project, user: other_user, title: "NotMine" }

    visit '/my/projects'
    page.assert_selector('li.project', count: 3)
    assert page.has_no_content?('NotMine')
  end

  test "can't edit someone else's project" do

  end

  test "successful creation of project makes it public" do

  end



end
