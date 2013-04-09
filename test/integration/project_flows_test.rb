require 'test_helper'

class ProjectFlowsTest < ActionDispatch::IntegrationTest
  test "the index page lists all our projects" do
    FactoryGirl.create(:project, :title => "one")
    FactoryGirl.create(:project, :title => "two")
    FactoryGirl.create(:project, :title => "three")

    visit '/projects'
    assert page.has_content?('Listing projects')
    assert page.has_content?('one')
    assert page.has_content?('two')
    assert page.has_content?('three')
  end

  test "navigation" do
    visit '/'

    # Capybara defines current_path.
    # http://rubydoc.info/github/jnicklas/capybara/master/Capybara/Session
    assert_equal root_path, current_path

    # The home nav element should be active
    assert_equal "Home", find('.navbar ul li.active a').text

    find('.navbar ul').click_link('Projects')
    assert_equal projects_path, current_path

    # Now, the projects nav element should be active.
    assert_equal "Projects", find('.navbar ul li.active a').text    
  end

end
  