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
end
  