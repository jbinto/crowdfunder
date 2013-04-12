require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  test "title is required" do
    project = FactoryGirl.build(:project, :title => nil)
    refute project.save
  end

  test "description is required" do
    project = FactoryGirl.build(:project, :description => nil)
    refute project.save
  end

  test "teaser is required" do
    project = FactoryGirl.build(:project, :teaser => nil)
    refute project.save
  end

  test "goal is required" do
    project = FactoryGirl.build(:project, :goal => nil)
    refute project.save
  end

  test "goal must be an integer greater than zero" do
    project = FactoryGirl.build(:project, :goal => -5)
    refute project.save

    project.goal = 0
    refute project.save    

    project.goal = 42.59
    refute project.save
  end



end
