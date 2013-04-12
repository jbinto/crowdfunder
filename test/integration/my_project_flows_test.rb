require 'test_helper'

class MyProjectFlowsTest < ActionDispatch::IntegrationTest

  test "lists only my projects" do 
    me = setup_logged_in_user
    other_user = FactoryGirl.create(:user)

    3.times { FactoryGirl.create :project, user: me }
    2.times { FactoryGirl.create :project, user: other_user, title: "NotMine" }

    visit '/my/projects'
    page.assert_selector('tr.project', count: 3)
    assert page.has_no_content?('NotMine')
  end

  test "can't edit someone else's project" do
    me = setup_logged_in_user
    other_user = FactoryGirl.create(:user)
    other_users_project = FactoryGirl.create(:project, user: other_user)

    visit edit_my_project_path(other_users_project)
    # assert 404? No, apparently that's not "integrationy" enough
    # as per https://groups.google.com/forum/?fromgroups=#!topic/ruby-capybara/NOvbNlykwpA
    # Test for content instead

    assert page.has_content?("doesn't exist")
  end

  test "can create a project" do
    me = setup_logged_in_user
    project = FactoryGirl.build(:project, user: me)

    visit '/my/projects/new'
    fill_in "project[title]", with: "abc"
    fill_in "project[teaser]", with: "abc"
    fill_in "project[description]", with: "abc"
    fill_in "project[goal]", with: "392"

    click_button 'Publish project'

    assert_equal my_projects_path, current_path
    assert find('.alert').has_content?('was created')

  end



end
