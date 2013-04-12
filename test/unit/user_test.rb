require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "email must be unique" do     
    user = FactoryGirl.create(:user)
    user2 = user.dup
    refute user2.save
  end

end
