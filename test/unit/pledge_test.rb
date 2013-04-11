require 'test_helper'

class PledgeTest < ActiveSupport::TestCase
  test "project is required" do
    pledge = FactoryGirl.build(:pledge)
    pledge.project = nil
    refute pledge.save
  end

  test "user is required" do
    pledge = FactoryGirl.build(:pledge)
    pledge.user = nil
    refute pledge.save
  end

  test "amount is required" do
    pledge = FactoryGirl.build(:pledge)
    pledge.amount = nil
    refute pledge.save
  end

  test "amount must be an integer" do
    pledge = FactoryGirl.build(:pledge)
    pledge.amount = "foo"
    refute pledge.save

    pledge.amount = 4.2093
    refute pledge.save
  end

  test "amount must be above 0" do
    pledge = FactoryGirl.build(:pledge)
    pledge.amount = -322
    refute pledge.save

    pledge.amount = 0
    refute pledge.save
  end
end
