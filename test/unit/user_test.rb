require 'test_helper'

class UserTest < ActiveSupport::TestCase

  should ensure_length_of(:password).is_at_least(4)
  should ensure_length_of(:password_confirmation).is_at_least(4)

  context "Minimal User not saved" do
    setup { @user = Factory.build(:user) }
    should("validate") { assert @user.valid? }
  end

  context "Minimal user" do
    setup { @user = Factory(:user) }
    should validate_uniqueness_of(:email)
  end
  
  context "New user" do
    setup { @user = Factory(:user) }
    
    should "have no friends" do
      assert_equal @user.friends.size, 0
      assert_equal @user.inverse_friendships.size, 0
      assert_equal @user.direct_friends.size, 0
      assert_equal @user.inverse_friends.size, 0
      assert_equal @user.pending_friends.size, 0
      assert_equal @user.requested_friendships.size, 0
    end
    
    should "have no ratings" do
      assert_equal @user.ratings.size, 0
    end
  end

end
