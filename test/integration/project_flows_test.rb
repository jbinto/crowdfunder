require 'test_helper'

class ProjectFlowsTest < ActionDispatch::IntegrationTest
  test "the index page lists all our projects" do
    visit '/projects'
    assert page.has_content?('Listing projects')
  end
end
